//
//  CreateNoteViewModel.swift
//  ShareThought
//
//  Created by Vishal M on 03/07/23.
//

import SwiftUI

class CreateNoteViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var date = Date()
    func saveNote() {
        let newNote = Note(title: title, content: content, date: date)
      
    }
}

