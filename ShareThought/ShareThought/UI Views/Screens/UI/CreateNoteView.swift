//
//  CreateNoteView.swift
//  ShareThought
//
//  Created by Vishal M on 01/07/23.
//

import SwiftUI

// View: CreateNoteView
struct CreateNoteView: View {
    @ObservedObject private var viewModel = CreateNoteViewModel()
    @State private var isNav:Bool = false
    var body: some View {
        NavigationView{
            VStack {
                TextField("Title", text: $viewModel.title)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                TextEditor(text: $viewModel.content)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.4), radius: 8)
                Button(action: {
                    //                    viewModel.saveNote()
                    isNav.toggle()
                }) {
                    Text("Save Note")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                .background(
                    NavigationLink(destination: ViewSavedNotes(), isActive: $isNav) {
                        EmptyView()
                    }
                )
                
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Create Note")
        }.environmentObject(viewModel)
    }
}

// Preview
struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView()
    }
}
