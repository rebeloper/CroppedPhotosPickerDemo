//
//  CropViewController+.swift
//  CroppedPhotosPickerDemo
//
//  Created by Alex Nagy on 16.04.2024.
//

import CropViewController
import UIKit

extension CropViewController {
    func setCroppingOptions(_ options: CroppedPhotosPickerOptions) {
        if let minimumAspectRatio = options.minimumAspectRatio {
            self.minimumAspectRatio = minimumAspectRatio
        }
        if let title = options.title {
            self.title = title
        }
        if let showActivitySheetOnDone = options.showActivitySheetOnDone {
            self.showActivitySheetOnDone = showActivitySheetOnDone
        }
        if let imageCropFrame = options.imageCropFrame {
            self.imageCropFrame = imageCropFrame
        }
        if let angle = options.angle {
            self.angle = angle
        }
        if let aspectRatioPreset = options.aspectRatioPreset {
            self.aspectRatioPreset = aspectRatioPreset
        }
        if let customAspectRatio = options.customAspectRatio {
            self.customAspectRatio = customAspectRatio
        }
        if let customAspectRatioName = options.customAspectRatioName {
            self.customAspectRatioName = customAspectRatioName
        }
        if let aspectRatioLockEnabled = options.aspectRatioLockEnabled {
            self.aspectRatioLockEnabled = aspectRatioLockEnabled
        }
        if let aspectRatioLockDimensionSwapEnabled = options.aspectRatioLockDimensionSwapEnabled {
            self.aspectRatioLockDimensionSwapEnabled = aspectRatioLockDimensionSwapEnabled
        }
        if let resetAspectRatioEnabled = options.resetAspectRatioEnabled {
            self.resetAspectRatioEnabled = resetAspectRatioEnabled
        }
        if let toolbarPosition = options.toolbarPosition {
            self.toolbarPosition = toolbarPosition
        }
        if let rotateClockwiseButtonHidden = options.rotateClockwiseButtonHidden {
            self.rotateClockwiseButtonHidden = rotateClockwiseButtonHidden
        }
        if let rotateButtonsHidden = options.rotateButtonsHidden {
            self.rotateButtonsHidden = rotateButtonsHidden
        }
        if let resetButtonHidden = options.resetButtonHidden {
            self.resetButtonHidden = resetButtonHidden
        }
        if let aspectRatioPickerButtonHidden = options.aspectRatioPickerButtonHidden {
            self.aspectRatioPickerButtonHidden = aspectRatioPickerButtonHidden
        }
        if let doneButtonHidden = options.doneButtonHidden {
            self.doneButtonHidden = doneButtonHidden
        }
        if let cancelButtonHidden = options.cancelButtonHidden {
            self.cancelButtonHidden = cancelButtonHidden
        }
        if let doneButtonTitle = options.doneButtonTitle {
            self.doneButtonTitle = doneButtonTitle
        }
        if let cancelButtonTitle = options.cancelButtonTitle {
            self.cancelButtonTitle = cancelButtonTitle
        }
        if let showOnlyIcons = options.showOnlyIcons {
            self.showOnlyIcons = showOnlyIcons
        }
        if let showCancelConfirmationDialog = options.showCancelConfirmationDialog {
            self.showCancelConfirmationDialog = showCancelConfirmationDialog
        }
        if let doneButtonColor = options.doneButtonColor {
            self.doneButtonColor = UIColor(doneButtonColor)
        }
        if let cancelButtonColor = options.cancelButtonColor {
            self.cancelButtonColor = UIColor(cancelButtonColor)
        }
        if let reverseContentLayout = options.reverseContentLayout {
            self.reverseContentLayout = reverseContentLayout
        }
    }
}

