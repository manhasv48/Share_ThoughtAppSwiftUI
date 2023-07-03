//
//  ThoughtsViewModel.swift
//  ShareThought
//
//  Created by Vishal M on 03/07/23.
//

import SwiftUI

class ThoughtsViewModel: ObservableObject {
    @Published var dummyData: DummyData?
    @Published var isDarkMode = false
    @Published var showAlert = false
    @Published var shouldNavigateToLogout = false

    init() {
        loadData()
    }

    func loadData() {
        guard let url = Bundle.main.url(forResource: "JsonFile", withExtension: "json") else {
            print("Json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder().decode(DummyData.self, from: data)
            self.dummyData = users
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }

    func logout() {
        showAlert = true
    }

    func confirmLogout() {
        shouldNavigateToLogout = true
    }

    func toggleDarkMode() {
        isDarkMode.toggle()
    }
}
