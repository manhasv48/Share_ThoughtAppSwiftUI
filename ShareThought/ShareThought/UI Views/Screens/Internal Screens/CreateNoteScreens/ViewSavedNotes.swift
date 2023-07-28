//
//  ViewSavedNotes.swift
//  ShareThought
//
//  Created by Vishal M on 03/07/23.
//

import SwiftUI


struct ViewSavedNotes: View {
    
    @EnvironmentObject private var viewModel:CreateNoteViewModel
    
    var body: some View {
        NavigationStack{
            List {
                NavigationLink(destination: ShowNotes()) {
                    NoteCell(titleText: $viewModel.title, dateText: $viewModel.date)
                    
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct ViewSavedNotes_Previews: PreviewProvider {
    static var previews: some View {
        ViewSavedNotes()
    }
}

