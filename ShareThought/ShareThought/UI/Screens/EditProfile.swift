//
//  ProfileVIewUi.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//

import SwiftUI

struct EditProfile: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var bio: String = ""
    
    var body: some View {
        ScrollView {
            ZStack{
                VStack(spacing: 10) {
                    HStack {
                        // Profile Image
                        Image("1")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(50)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.blue)
                            .padding()
                            .onTapGesture {
                                // Code to open gallery goes here
                            }
                        
                        Spacer() // Add spacer to push text fields to the right
                    }
                    
                    Divider() // Line separator
                    
                    // Name
                    TextField("Enter your name", text: $name)
                        .font(.system(size: 15, weight: .thin))
                        .foregroundColor(.primary)
                        .padding()
                    
                    Divider() // Line separator
                    
                    // Email
                    TextField("Enter your email", text: $email)
                        .font(.system(size: 15, weight: .thin))
                        .foregroundColor(.primary)
                        .padding()
                    
                    Divider() // Line separator
                    
                    // Bio
                    TextField("Enter your bio", text: $bio)
                        .font(.system(size: 15, weight: .thin))
                        .foregroundColor(.primary)
                        .padding()
                    
                    Divider() // Line separator
                    
                    // Save button
                    Button(action: {
                        // Code to save changes
                    }) {
                        Text("Save")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.blue)
                            .cornerRadius(4.0)
                            .padding()
                    }
                }
                
            }
        }
    }
}

struct EditView{
    
}
struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
