//
//  CroppedPhotosPicker.swift
//  CroppedPhotosPickerDemo
//
//  Created by Alex Nagy on 16.04.2024.
//

import SwiftUI
import PhotosUI
import CropViewController

struct CroppedPhotosPicker<Label: View>: View {
    
    struct SelectedImage: Identifiable {
        var id = UUID().uuidString
        
        var image: UIImage
    }
    
    private var style: CroppedPhotosPickerCroppingStyle
    private var options: CroppedPhotosPickerOptions
    @Binding private var selection: UIImage?
    private var didCrop: ((CropView.CroppedRect) -> ())?
    private var didCancel: (() -> ())?
    @ViewBuilder private var label: () -> Label
    
    init(style: CroppedPhotosPickerCroppingStyle = .default,
         options: CroppedPhotosPickerOptions = .init(),
         selection: Binding<UIImage?>,
         didCrop: ((CropView.CroppedRect) -> Void)? = nil,
         didCancel: (() -> Void)? = nil,
         @ViewBuilder label: @escaping () -> Label) {
        self.style = style
        self.options = options
        self._selection = selection
        self.didCrop = didCrop
        self.didCancel = didCancel
        self.label = label
    }
    
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var selectedImage: SelectedImage?
    
    var body: some View {
        PhotosPicker(selection: $photosPickerItem) {
            label()
        }
        .onChange(of: photosPickerItem) { _, newValue in
            if let newValue {
                Task {
                    let uiImage = await newValue.convert()
                    guard let uiImage else { return }
                    selectedImage = SelectedImage(image: uiImage)
                }
            }
        }
        .sheet(item: $selectedImage) { selectedImage in
            CropView(image: selectedImage.image, croppingStyle: style, croppingOptions: options) { image in
                self.selectedImage = nil
                self.photosPickerItem = nil
                self.selection = image.image
                self.didCrop?(CropView.CroppedRect(rect: image.rect, angle: image.angle))
            } didCropToCircularImage: { image in
                self.selectedImage = nil
                self.photosPickerItem = nil
                self.selection = image.image
                self.didCrop?(CropView.CroppedRect(rect: image.rect, angle: image.angle))
            } didCropImageToRect: { _ in
                
            } didFinishCancelled: { _ in
                self.selectedImage = nil
                self.photosPickerItem = nil
                didCancel?()
            }
            .ignoresSafeArea()
        }
    }
}
