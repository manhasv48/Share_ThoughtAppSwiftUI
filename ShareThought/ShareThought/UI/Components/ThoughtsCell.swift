//
//  ThoughtsCell.swift
//  ShareThought
//
//  Created by Vishal M on 02/07/23.
//

import SwiftUI

struct ThoughtsCell: View {
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
