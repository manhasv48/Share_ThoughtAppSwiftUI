//
//  ShowNotes.swift
//  ShareThought
//
//  Created by Vishal M on 03/07/23.
//

import SwiftUI

struct ShowNotes: View {
    
    @EnvironmentObject private var viewModel:CreateNoteViewModel
    var body: some View {
        Text(viewModel.content)
    }
}

struct ShowNotes_Previews: PreviewProvider {
    static var previews: some View {
        ShowNotes()
    }
}
