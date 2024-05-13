//
//  CroppedPhotosPickerOptions.swift
//  CroppedPhotosPickerDemo
//
//  Created by Alex Nagy on 16.04.2024.
//

import Foundation
import SwiftUI
import CropViewController

struct CroppedPhotosPickerOptions {
    var minimumAspectRatio: CGFloat?
    var title: String?
    var showActivitySheetOnDone: Bool?
    var imageCropFrame: CGRect?
    var angle: Int?
    var aspectRatioPreset: CropViewControllerAspectRatioPreset?
    var customAspectRatio: CGSize?
    var customAspectRatioName: String?
    var aspectRatioLockEnabled: Bool?
    var aspectRatioLockDimensionSwapEnabled: Bool?
    var resetAspectRatioEnabled: Bool?
    var toolbarPosition: CropViewControllerToolbarPosition?
    var rotateClockwiseButtonHidden: Bool?
    var rotateButtonsHidden: Bool?
    var resetButtonHidden: Bool?
    var aspectRatioPickerButtonHidden: Bool?
    var doneButtonHidden: Bool?
    var cancelButtonHidden: Bool?
    var activityItems: [Any]?
    var applicationActivities: [UIActivity]?
    var excludedActivityTypes: [UIActivity.ActivityType]?
    var allowedAspectRatios: [CropViewControllerAspectRatioPreset]?
    var hidesNavigationBar: Bool?
    var doneButtonTitle: String?
    var cancelButtonTitle: String?
    var showOnlyIcons: Bool?
    var showCancelConfirmationDialog: Bool?
    var doneButtonColor: Color?
    var cancelButtonColor: Color?
    var reverseContentLayout: Bool?
}
