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
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    init() {
        loadData()
    }

    func loadData() {
        isLoading = true
        guard let url = Bundle.main.url(forResource: "JsonFile", withExtension: "json") else {
           errorMessage  = "file not found"
            return
        }
        
        do {
            
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder().decode(DummyData.self, from: data)
            self.dummyData = users
            isLoading = false
        } catch {
            errorMessage = APIError.badURL.localizedDescription
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
