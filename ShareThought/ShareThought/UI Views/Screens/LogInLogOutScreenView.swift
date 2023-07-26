//
//  LogInLogOutScreenView.swift
//  ShareThought
//
//  Created by Vishal M on 30/06/23.
//

import SwiftUI

struct LogInLogOutScreenView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var naviGateDashBoard = false
    @State private var hasAttemptedLogin = false


    var isEmailValid: Bool {
        !username.isEmpty && username.isValidEmail()
    }
    
    var isPasswordValid: Bool {
        !password.isEmpty && password.isPasswordValid()
    }
    
    var isLoginButtonDisabled: Bool {
        !isEmailValid || !isPasswordValid
    }

    var body: some View {
        NavigationView {
            Group {
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "person.circle")
                            TextField("Email or Name", text: $username)
                                .foregroundColor(.black)
                            Image(systemName: isEmailValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(isEmailValid ? .green : .red)
                                .opacity(username.isEmpty ? 0 : 1) // Hide image when the field is empty
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(hasAttemptedLogin && !isEmailValid ? Color.red :  Color.black ))
                        
                        HStack {
                            Image(systemName: "lock")
                            SecureField("Password", text: $password)
                                .foregroundColor(.black)
                            Image(systemName: isPasswordValid ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(isPasswordValid ? .green : .red)
                                .opacity(password.isEmpty ? 0 : 1) // Hide image when the field is empty
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(hasAttemptedLogin && !isPasswordValid  ? Color.red :  Color.black ))
                        
                        Button("Login", action: {
                            if isLoginButtonDisabled{
                                hasAttemptedLogin = true
                            }else{
                                naviGateDashBoard = true
                            }
                        })
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(height: 46)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 2)
                        )
                      
                    }
                   
                    
                    Spacer()
                    
                    NavigationLink(destination: HomeTabBarView(), isActive: $naviGateDashBoard) {
                        EmptyView()
                    }
                    .navigationBarBackButtonHidden()
                    
                    Button("Create new account", action: {
                        // Implement account creation logic here
                    })
                    .foregroundColor(.black)
                    .font(.headline)
                    .frame(height: 46)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 2)
                    )
                }
                .padding()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }
    }
}

struct LogInLogOutScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LogInLogOutScreenView()
    }
}
