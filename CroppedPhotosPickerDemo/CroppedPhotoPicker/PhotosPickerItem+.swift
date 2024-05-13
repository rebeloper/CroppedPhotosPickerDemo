//
//  PhotosPickerItem+.swift
//  CroppedPhotosPickerDemo
//
//  Created by Alex Nagy on 16.04.2024.
//

import SwiftUI
import PhotosUI

extension PhotosPickerItem {
    /// Load and return an image from a PhotosPickerItem
    @MainActor
    func convert() async -> UIImage? {
        do {
            if let data = try await self.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    return uiImage
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

