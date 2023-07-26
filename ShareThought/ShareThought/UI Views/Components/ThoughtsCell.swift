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
            }.padding(.trailing,20)
                .padding(.leading,20)
        
    }
}
