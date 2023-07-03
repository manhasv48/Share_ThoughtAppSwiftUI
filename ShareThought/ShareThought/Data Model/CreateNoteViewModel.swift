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
    
    func saveNote() {
        print(title)
        // Create a new note using the provided title, content, and current date
        let newNote = Note(title: title, content: content, date: Date())
        
        // Perform necessary operations to save the note to a local database or any other storage
        // For the sake of simplicity, we'll just print the note here
        print("New Note: \(newNote)")
    }
}

