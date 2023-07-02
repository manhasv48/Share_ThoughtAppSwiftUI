//
//  ThoughtsViewUI.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//

import SwiftUI

struct ThoughtsViewUI: View {
    @State private var dummyData: DummyData?
    @State private var isDarkMode = false
    @State private var showAlert: Bool = false
    @State private var shouldNavigateToLogout = false
    
    var body: some View {
        NavigationView {
            Group {
                if let dummyData = dummyData, dummyData.dummyData.count == dummyData.image.count && dummyData.dummyData.count == dummyData.names.count {
                    List {
                        ForEach(dummyData.dummyData.indices, id: \.self) { index in
                            let thoughtText = dummyData.dummyData[index]
                            let imageName = dummyData.image[index]
                            let name = dummyData.names[index]
                            ThoughtsCell(dummyText: thoughtText, imageName: imageName, name: name, textColor: isDarkMode)
                                .padding(.vertical, 16)
                        }
                        .contentShape(Rectangle()) // Set the cell's content shape
                        .onTapGesture {
                            // Handle cell tap here
                        }
                        .listRowInsets(EdgeInsets()) // Remove the padding and trailing spacing
                        .listRowSeparatorTint(.clear)
                    }
                    .listStyle(PlainListStyle()) // Remove the grouping style
                } else {
                    Text("Error: Data count mismatch")
                }
            }
            .navigationBarTitle("Thoughts")
            .navigationBarItems(
                leading: HStack {
                    Button(action: {
                        self.showAlert = true
                    }) {
                        Image(systemName: "square.and.arrow.up.circle")
                            .imageScale(.large)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Confirm Logout"),
                            message: Text("Are you sure you want to log out?"),
                            primaryButton: .default(Text("Yes"), action: {
                                shouldNavigateToLogout = true
                            }),
                            secondaryButton: .cancel(Text("No"))
                        )
                    }
                    .background(
                        NavigationLink(destination: LogInLogOutScreenView(), isActive: $shouldNavigateToLogout) {
                            EmptyView()
                        }
                    )
                },
                trailing: HStack {
                    Button(action: {
                        isDarkMode.toggle()
                    }) {
                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                            .foregroundColor(isDarkMode ? .white : .black)
                            .imageScale(.large)
                    }
                }
            )
        }
        .onAppear {
            loadData()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
    private func loadData() {
        guard let url = Bundle.main.url(forResource: "JsonFile", withExtension: "json") else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode(DummyData.self, from: data!)
        self.dummyData = users!
    }
}

struct ThoughtsViewUI_Previews: PreviewProvider {
    static var previews: some View {
        ThoughtsViewUI()
    }
}
