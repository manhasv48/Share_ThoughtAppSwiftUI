//
//  ThoughtsViewUI.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//
import SwiftUI

struct ThoughtsViewUI: View {
    @State private var dummyData: DummyData?
    
    var body: some View {
        Group {
            if let dummyData = dummyData, dummyData.dummyData.count == dummyData.image.count && dummyData.dummyData.count == dummyData.names.count {
                List {
                    ForEach(dummyData.dummyData.indices, id: \.self) { index in
                        let thoughtText = dummyData.dummyData[index]
                        let imageName = dummyData.image[index]
                        let name = dummyData.names[index]
                        ThoughtCell(dummyText: thoughtText, imageName: imageName, name: name)
                    }
                }
            } else {
                Text("Error: Data count mismatch")
            }
        }
        .onAppear {
            loadData()
        }
    }
    
    private  func loadData()  {
        guard let url = Bundle.main.url(forResource: "JsonFile", withExtension: "json")
            else {
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
                Spacer()
            }
            HStack {
                Text(dummyText) // Display the dummy text
                    .font(.headline)
                    .foregroundColor(.black)
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
                .padding(.trailing, 8) // Add padding to the like button
                
                Button(action: {
                    print("Clicked on Comment")
                }) {
                    Image(systemName: "message.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black) // Set tint color to black
                }
                .padding(.trailing, 8) // Add padding to the comment button
                
                Button(action: {
                    print("Clicked on Share")
                }) {
                    Image(systemName: "arrowshape.turn.up.forward.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black) // Set tint color to black
                }
                Spacer()
            }
        }
    }
}

struct ThoughtsViewUI_Previews: PreviewProvider {
    static var previews: some View {
        ThoughtsViewUI()
    }
}
