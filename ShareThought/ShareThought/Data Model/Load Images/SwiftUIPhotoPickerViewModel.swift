//
//  LoadImags.swift
//  ShareThought
//
//  Created by Vishal M on 30/07/23.
//

import Foundation
import SwiftUI
import _PhotosUI_SwiftUI
@MainActor
final class PhotoPickerViewModel:ObservableObject{
    @Published private(set) var selectedImage:UIImage? = nil
    @Published  var imageSelection :PhotosPickerItem? = nil{
        didSet{
            setImage(from: imageSelection)
        }
    }
    
    @Published private(set) var selectedImages:[UIImage] = []
    @Published  var imageSelections :[PhotosPickerItem] = []{
        didSet{
            setImages(from: imageSelections)
        }
    }
    
    private func setImage(from selection:PhotosPickerItem?) {
        guard let selection else{return}
        Task{
            do{
                let data = try await selection.loadTransferable(type: Data.self )
                guard let data, let uiImage = UIImage(data: data)else{
                    throw URLError(.badServerResponse)
                }
            }catch{
                print(error)
            }
        }
    }
    
    private func setImages(from selections:[PhotosPickerItem]) {
      
        Task{
            var images:[UIImage] = []
            for selection in selections{
                if let data = try? await selection.loadTransferable(type: Data.self){
                    if let uiImage = UIImage(data: data){
                        images.append(uiImage)
                        
                    }
                }
            }
        selectedImages = images
        }
    }
}
