//
//  CropView.swift
//  CroppedPhotosPickerDemo
//
//  Created by Alex Nagy on 16.04.2024.
//

import SwiftUI
import CropViewController

struct CropView: UIViewControllerRepresentable {
    
    struct CroppedRect {
        let rect: CGRect
        let angle: Int
    }
    
    struct CroppedImage {
        let image: UIImage
        let rect: CGRect
        let angle: Int
    }
    
    private var image: UIImage
    private var didCropToImage: ((CroppedImage) -> ())?
    private var didCropToCircularImage: ((CroppedImage) -> ())?
    private var didCropImageToRect: ((CroppedRect) -> ())?
    private var didFinishCancelled: (Bool) -> ()
    
    private let controller: CropViewController
    
    init(image: UIImage, 
         croppingStyle: CroppedPhotosPickerCroppingStyle = .default,
         croppingOptions: CroppedPhotosPickerOptions = .init(),
         didCropToImage: ((CroppedImage) -> Void)? = nil,
         didCropToCircularImage: ((CroppedImage) -> Void)? = nil,
         didCropImageToRect: ((CroppedRect) -> Void)? = nil,
         didFinishCancelled: @escaping (Bool) -> Void) {
        
        self.image = image
        
        self.didCropToImage = didCropToImage
        self.didCropToCircularImage = didCropToCircularImage
        self.didCropImageToRect = didCropImageToRect
        self.didFinishCancelled = didFinishCancelled
        
        self.controller = CropViewController(croppingStyle: croppingStyle, image: image)
        self.controller.setCroppingOptions(croppingOptions)
    }
    
    class Coordinator: NSObject, CropViewControllerDelegate {
        let parent: CropView
        
        init(parent: CropView) {
            self.parent = parent
        }
        
        func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            let croppedImage = CroppedImage(image: image, rect: cropRect, angle: angle)
            parent.didCropToImage?(croppedImage)
        }
        
        func cropViewController(_ cropViewController: CropViewController, didCropToCircularImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
            let croppedImage = CroppedImage(image: image, rect: cropRect, angle: angle)
            parent.didCropToImage?(croppedImage)
        }
        
        func cropViewController(_ cropViewController: CropViewController, didCropImageToRect cropRect: CGRect, angle: Int) {
            let croppedRect = CroppedRect(rect: cropRect, angle: angle)
            parent.didCropImageToRect?(croppedRect)
        }
        
        func cropViewController(_ cropViewController: CropViewController, didFinishCancelled cancelled: Bool) {
            parent.didFinishCancelled(cancelled)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
