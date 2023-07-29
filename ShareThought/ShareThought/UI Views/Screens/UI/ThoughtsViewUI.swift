//
//  ThoughtsViewUI.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//

import SwiftUI

struct ThoughtsViewUI: View {
    
    @ObservedObject private var viewModel = ThoughtsViewModel()
    @State var onItemClick:Bool = false
    @State var image:UIImage?
    var body: some View {
        NavigationView{
            Group {
                if let dummyData = viewModel.dummyData, dummyData.dummyData.count == dummyData.image.count && dummyData.dummyData.count == dummyData.names.count && dummyData.dummyData.count == dummyData.id.count{
                    List {
                        
                        ForEach(dummyData.dummyData.indices, id: \.self) { index in
                            let thoughtText = dummyData.dummyData[index]
                            let imageName = dummyData.image[index]
                            let name = dummyData.names[index]
                            
                            ThoughtsCell(dummyText: thoughtText, imageName: imageName, name: name, textColor: viewModel.isDarkMode)
                                .padding(.vertical, 16)
                                .onTapGesture{
                                    onItemClick = true
                                    print(onItemClick)
                                }
                        }
                        .listRowInsets(EdgeInsets()) // Remove the padding and trailing spacing
                        .listRowSeparatorTint(.clear)
                    }
                    .listStyle(PlainListStyle()) // Remove the grouping style
                } else {
                    ErrorView(viewModel:ThoughtsViewModel())
                }
                NavigationLink(destination: HideImageView(selectedImages: self.image ?? UIImage() ), isActive:$onItemClick) {
                    EmptyView()
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitle("Thoughts")
            .navigationBarItems(
                leading: HStack {
                    Button(action: {
                        viewModel.logout()
                    }) {
                        Image(systemName: "square.and.arrow.up.circle")
                            .imageScale(.large)
                            .foregroundColor(viewModel.isDarkMode ? .white : .black)
                    }
                    .background(
                        NavigationLink(destination: LogInLogOutScreenView(), isActive: $viewModel.shouldNavigateToLogout) {
                            EmptyView()
                        }
                    )
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(
                            title: Text("Confirm Logout"),
                            message: Text("Are you sure you want to log out?"),
                            primaryButton: .default(Text("Yes"), action: {
                                viewModel.confirmLogout()
                            }),
                            secondaryButton: .cancel(Text("No"))
                        )
                    }
                },
                trailing: HStack {
                    Button(action: {
                        viewModel.toggleDarkMode()
                    }) {
                        Image(systemName: viewModel.isDarkMode ? "sun.max.fill" : "moon.fill")
                            .foregroundColor(viewModel.isDarkMode ? .white : .black)
                            .imageScale(.large)
                    }
                }
            )
            .preferredColorScheme(viewModel.isDarkMode ? .dark : .light)
        }
    }
}
struct ThoughtsViewUI_Previews: PreviewProvider {
    static var previews: some View {
        ThoughtsViewUI()
    }
}
