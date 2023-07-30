//
//  ImagePicker.swift
//  ShareThought
//
//  Created by Vishal M on 28/07/23.
//

import Foundation
import SwiftUI
import PhotosUI
enum PhotoSheetType: Identifiable {
    var id: UUID {
        UUID()
    }
    case gallery
    case picture
}


struct ImagePicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var showingType: PhotoSheetType?
    @Binding var image: UIImage

    
    func makeCoordinator() -> ImagePicker.Coordinator {
        let imagePicker = UIImagePickerController()
        return ImagePicker.Coordinator(child1: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var child : ImagePicker
        init(child1: ImagePicker) {
            child = child1
        }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.child.showingType = nil
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let image = info[.originalImage] as! UIImage
            self.child.image = image
            self.child.showingType = nil
        }
    }
}




struct MultipleImagePicker: UIViewControllerRepresentable {
    @Binding var showingType: PhotoSheetType?
    @Binding var selectedImages: [UIImage]

    func makeCoordinator() -> MultipleImagePicker.Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MultipleImagePicker>) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0 // Set the limit to 0 for unlimited selection
        configuration.filter = .images // Only show images in the picker
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<MultipleImagePicker>) {
        // You can perform updates if needed
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: MultipleImagePicker

        init(_ parent: MultipleImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true, completion: nil)

            for result in results {
                if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        if let error = error {
                            print("Error loading image: \(error)")
                        } else if let image = image as? UIImage {
                            DispatchQueue.main.async {
                                self.parent.selectedImages.append(image)
                            }
                        }
                    }
                }
            }

            self.parent.showingType = nil
        }
    }
}
