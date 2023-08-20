//
//  AddContactView.swift
//  ShareThought
//
//  Created by Vishal M on 20/08/23.
//

import SwiftUI


struct AddContactView: View {
    @Binding var newContactName: String
    @Binding var isAddingContact: Bool
    @Binding var contacts: [Contact]

    var body: some View {
        VStack {
            TextField("Enter name", text: $newContactName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Contact") {
                if !newContactName.isEmpty {
                    contacts.append(Contact(name: newContactName))
                    newContactName = ""
                    isAddingContact = false
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding()
    }
}
