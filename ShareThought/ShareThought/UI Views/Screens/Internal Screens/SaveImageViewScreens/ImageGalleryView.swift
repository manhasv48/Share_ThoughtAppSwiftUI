//
//  ImageGalleryView.swift
//  ShareThought
//
//  Created by Vishal M on 29/07/23.
//

import SwiftUI
import _PhotosUI_SwiftUI
struct ImageGalleryView: View {
    @ObservedObject private var viewModel = UIKitPhotoPickerViewModel()

    var body: some View {
        VStack(spacing: 40) {
            if !viewModel.selectedImages.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.selectedImages, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .frame(height: 40)
                                .frame(width: 40)
                        }
                    }
                }
            } else {
                Text("No images to show. Please add.")
                    .foregroundColor(Color.textColor1)
            }
        }
    }
}
