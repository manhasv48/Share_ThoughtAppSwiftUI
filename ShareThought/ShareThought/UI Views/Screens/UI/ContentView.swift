//
//  ThoughtsViewUI.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//

import SwiftUI
struct ContentView: View {
    @State private var isAddingContact = false
    @State private var newContactName = ""
    @State private var contacts: [Contact] = []

    var body: some View {
        NavigationView {
            VStack {
                List(contacts) { contact in
                    HStack{
                        Image("1")
                            .resizable()
                            .frame(width: 75,height: 75)
                            .cornerRadius(37.5)
                        VStack(alignment: .leading){
                            Text(contact.name)
                            Text("9850026748")
                        }
                    }
                }
                .animation(.default)
                .listRowSeparator(.hidden)
                .listRowSeparatorTint(Color.clear)
                .listStyle(.plain)
                

                Button(action: {
                    isAddingContact = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.blue)
                }
                .padding()
                .sheet(isPresented: $isAddingContact) {
                    AddContactView(newContactName: $newContactName, isAddingContact: $isAddingContact, contacts: $contacts)
                }
            }
            .navigationBarTitle("Contacts")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
