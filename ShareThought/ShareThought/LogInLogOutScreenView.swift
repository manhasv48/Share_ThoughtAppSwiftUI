//
//  LogInLogOutScreenView.swift
//  ShareThought
//
//  Created by Vishal M on 30/06/23.
//

import SwiftUI
import UIKit
struct LogInLogOutScreenView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var naviGateDashBoard = false
    
    var body: some View {
        NavigationView {
                Group {
                    VStack {
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 12) {
                            TextField("username or number", text: $username)
                                .font(.system(size: 15, weight: .thin))
                                .foregroundColor(.primary)
                                .frame(height: 44)
                                .background(Color.white)
                                .cornerRadius(4.0)
                            
                            SecureField("password", text: $password)
                                .font(.system(size: 15, weight: .thin))
                                .foregroundColor(.primary)
                                .frame(height: 44)
                                .background(Color.white)
                                .cornerRadius(4.0)
                            
                            Button("Login", action: {
                                naviGateDashBoard = true
                            })
                            .foregroundColor(.white)
                            .font(.headline)
                            .buttonBorderShape(.capsule)
                            .frame(height: 44)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 16)
                            .background(Color.blue)
                            .cornerRadius(4.0)
                            
                            Button("Forgotten Password ?", action: {
                                
                            })
                            .foregroundColor(.blue)
                            .font(.footnote)
                            .frame(maxWidth: .infinity)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: HomeTabBarView(), isActive: $naviGateDashBoard) {
                            EmptyView()
                        }
                        
                        Button("Create new account", action: {
                            
                        })
                        .foregroundColor(.blue)
                        .font(.caption2)
                        .buttonBorderShape(.capsule)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 16)
                        .background(Color.gray.opacity(0.3))
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                }
                .navigationBarHidden(true)
            }
        }
    }


struct LogInLogOutScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LogInLogOutScreenView()
    }
}
