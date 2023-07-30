//
//  UIKitPhotoPickerVIewModel.swift
//  ShareThought
//
//  Created by Vishal M on 30/07/23.
//

import Foundation
import UIKit

import SwiftUI

class UIKitPhotoPickerViewModel: ObservableObject {
    @Published var selectedImages: [UIImage] = []
    @Published var selectedImage: UIImage = UIImage()
    
    @Published var isUploading: Bool = false
    @Published var uploadedCount: Int = 0

    // Function to start the image upload process
    func uploadImages() {
        isUploading = true
        uploadedCount = 0
        for image in selectedImages {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.uploadedCount += 1
                
                // Check if all images have been uploaded
                if self.uploadedCount == self.selectedImages.count {
                    // Reset the progress state
                    self.isUploading = false
                    self.uploadedCount = 0
                }
            }
        }
    }
    
    func numberOfProgressBars() -> Int {
            
            return uploadedCount
        }
    
}
