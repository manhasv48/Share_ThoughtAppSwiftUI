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
                VStack{
                    Button(action: {
                        
                    }){
                        Text("View Saved Image")
                            .foregroundColor(Color.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                        
                    }.padding()
                    VStack {
                        Text("Upload Your Images").padding(.top)
                            .font(.largeTitle)
                        Text("PNG,JGG files are allowed")
                            .foregroundColor(Color.textColor1)
                        VStack {

                            Image("upload_images")
                                .resizable()
                                .frame(width: 65,height:65)
                                .onTapGesture{
                                    isPopupVisible = true
                                }
                                .padding(.top)
                            
                            Button(action: {
                                isPopupVisible = true
                            }) {
                                Text("Browse to Choose a Images")
                                    .foregroundColor(Color.textColor1)
                            }.padding(.bottom
                            )
                            
                        }.frame(maxWidth: .infinity)
                            .background(Color.backGround1)
                            .cornerRadius(12)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                        .background(Color.backGround)
                        .cornerRadius(12)
                        .padding()
                    Spacer()
                }
            }
            .actionSheet(isPresented: $isPopupVisible) {
                ActionSheet(
                    title: Text("Select an Image"),
                    message: Text(""),
                    buttons: [
                        .default(Text("Select from Gallery")) {
                            showingType = .gallery /// 3.
                        },
                        .default(Text("Take new picture")) {
                            showingType = .picture /// 3.
                        },
                        .cancel()
                    ]
                )
            }
.sheet(item: $showingType, content: { type in
if type == .gallery {
    ImagePicker(sourceType: .photoLibrary, showingType: $showingType, image: $selectedImages)
} else {
    ImagePicker(sourceType: .camera, showingType: $showingType, image: $selectedImages)
}
})
        
    }
}


struct HideImageView_Previews: PreviewProvider {
    static var previews: some View {
        HideImageView(selectedImages: UIImage())
    }
}
