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
    var body: some View {
        NavigationView {
            Group {
                if let dummyData = dummyData, dummyData.dummyData.count == dummyData.image.count && dummyData.dummyData.count == dummyData.names.count {
                    List {
                        ForEach(dummyData.dummyData.indices, id: \.self) { index in
                            let thoughtText = dummyData.dummyData[index]
                            let imageName = dummyData.image[index]
                            let name = dummyData.names[index]
                            ThoughtCell(dummyText: thoughtText, imageName: imageName, name: name, textColor: isDarkMode)
                                .padding(.vertical,16)
                               
                        }
                        .contentShape(Rectangle()) // Set the cell's content shape
                        .onTapGesture { } // Di
                        .listRowInsets(EdgeInsets())// Remove the padding and trailing spacing
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
                        // Left side button action
                        // Implement logout functionality here
                    }) {
                        Image(systemName: "square.and.arrow.up.circle")
                            .imageScale(.large)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                },
                trailing: HStack {
                    Button(action: {
                        isDarkMode.toggle()
                    }) {
                        Image(systemName: "sun.max.fill" )
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

struct ThoughtCell: View {
    let dummyText: String // Dummy data for the text in each cell
    let imageName: String
    let name: String
    let textColor:Bool
    
    var body: some View {
        VStack {
                HStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    Spacer()
                }
                HStack {
                    Text(name)
                        .foregroundColor(.purple)
                        .fontDesign(.monospaced)
                    Spacer()
                }
                HStack {
                    Text(dummyText)
                        .font(.caption)
                        .fontDesign(.serif)
                        .foregroundColor(textColor ? .white : .black)
                    Spacer()
                }
                
                HStack {
                    Button(action: {
                        print("Clicked on Like")
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black) // Set tint color to black
                    }
                    .buttonStyle(PlainButtonStyle())
                   
                    
                    Button(action: {
                        print("Clicked on Comment")
                    }) {
                        Image(systemName: "message.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black) // Set tint color to black
                    }
                    .buttonStyle(PlainButtonStyle())
                   
                    
                    Button(action: {
                        print("Clicked on Share")
                    }) {
                        Image(systemName: "arrowshape.turn.up.forward.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black) // Set tint color to black
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }.padding(.trailing,20)
                .padding(.leading,20)
        
    }
}

struct ThoughtsViewUI_Previews: PreviewProvider {
    static var previews: some View {
        ThoughtsViewUI()
    }
}
