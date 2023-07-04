//
//  NoteCell.swift
//  ShareThought
//
//  Created by Vishal M on 03/07/23.
//

import SwiftUI


struct NoteCell: View {
    @Binding var titleText: String
    @Binding var dateText: Date
    
    var body: some View {
        VStack {
            Text(titleText)
            Text("\(dateText)")
        }
    }
}

struct NoteCell_Previews: PreviewProvider {
    static var previews: some View {
        NoteCell(titleText: .constant("Sample Title"), dateText: .constant(Date()))
    }
}