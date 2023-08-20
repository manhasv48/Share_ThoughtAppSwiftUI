//
//  HideImageView.swift
//  ShareThought
//
//  Created by Vishal M on 28/07/23.
//

import SwiftUI
struct HideImageView: View {
    @ObservedObject private var viewModel = UIKitPhotoPickerViewModel()
    @State private var showingType: PhotoSheetType?
    @State private var isPopupVisible = false
    @State private var showGallery:Bool = false
    @State private var savedImageGallery:Bool = false
    @State private var url:[URL] = []
    var body: some View {
        ZStack {
            ScrollView{
            VStack{
                NavigationLink(destination: ImageGalleryView(), isActive: $savedImageGallery) {
                    EmptyView()
                }
                if !viewModel.selectedImages.isEmpty{
                    Button(action: {
                        savedImageGallery = true
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
                }
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
                    if !viewModel.selectedImages.isEmpty{
                        VStack{
                            HStack{
                                Text("0 of \(viewModel.selectedImages.count) uploaded")
                                    .foregroundColor(.textColor1)
                                    .font(.subheadline)
                                Spacer()
                                Text("cancel")
                                    .font(.subheadline)
                                    .foregroundColor(.textColor1)
                            }.padding()
                            ForEach(viewModel.selectedImages, id: \.self) { image in
                                ProgressBar(progress: 1.0)
                                    .frame(height: 45)
                                
                            }
                        }.padding()
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.backGround)
                .cornerRadius(12)
                .padding()
            }
        }
            }
            .actionSheet(isPresented: $isPopupVisible) {
                ActionSheet(
                    title: Text("Select an Image"),
                    message: Text(""),
                    buttons: [
                        .default(Text("Select from Gallery")) {
                            showingType = .gallery
                        },
                        .default(Text("Take new picture")) {
                            showingType = .picture 
                        },
                        .cancel()
                    ]
                )
            }
.sheet(item: $showingType, content: { type in
if type == .gallery {
    MultipleImagePicker(showingType: $showingType, selectedImages: $viewModel.selectedImages )
} else {
    ImagePicker(sourceType: .camera, showingType: $showingType, image:$viewModel.selectedImage  )
}
})
    }
}


struct HideImageView_Previews: PreviewProvider {
    static var previews: some View {
        HideImageView()
    }
}

struct ProgressBar: View {
    let progress: CGFloat
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray)
                    .frame(width: geometry.size.width, height: 40)
                    .cornerRadius(12)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: geometry.size.width * min(self.progress, 1.0), height: 40)
                    .cornerRadius(12)
            }
        }
    }
}
