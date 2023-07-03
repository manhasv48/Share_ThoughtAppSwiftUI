//
//  CreateNoteView.swift
//  ShareThought
//
//  Created by Vishal M on 01/07/23.
//

import SwiftUI

// View: CreateNoteView
struct CreateNoteView: View {
    @StateObject private var viewModel = CreateNoteViewModel()
    
    var body: some View {
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
                viewModel.saveNote()
            }) {
                Text("Save Note")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Create Note")
    }
}

// Preview
struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView()
    }
}
