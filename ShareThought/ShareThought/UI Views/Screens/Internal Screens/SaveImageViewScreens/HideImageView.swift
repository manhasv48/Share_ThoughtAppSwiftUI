//
//  HideImageView.swift
//  ShareThought
//
//  Created by Vishal M on 28/07/23.
//

import SwiftUI
struct HideImageView: View {
    @State private var showingType: PhotoSheetType?
    @State private var isPopupVisible = false
    @State  var selectedImages: UIImage
    @State private var showGallery:Bool = false
    var body: some View {
        
            ZStack {
                VStack {
                    Image(uiImage: selectedImages ?? UIImage())
                        .resizable()
                        .frame(width: 75, height: 75)
                    Button(action: {
                        isPopupVisible = true
                    }) {
                        Text("Choose Images")
                    }
                }

                if isPopupVisible {
                    popupView()
                        .transition(.identity) // You can apply a custom transition
                        .animation(.easeInOut(duration: 2.3)) // Animation for the popup appearance
                }
            }
        
    }

    private func popupView() -> some View {
        VStack {
            NavigationLink(destination: ImagePicker(showingType:$showingType , image: $selectedImages), isActive:$showGallery ){
                EmptyView()
            }
            .navigationBarBackButtonHidden()
            .hidden()
            Button(action: {
                showingType = .gallery
                showGallery = true
            }) {
                Text("Select from Gallery")
            }
               
            Divider()

            Button(action: {
                showingType = .picture
                showGallery = true
            }) {
                Text("Take new picture")
            }
              
            Divider()

            Button(action: {
                isPopupVisible = false
            }) {
                Text("Cancel")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
    }
}

