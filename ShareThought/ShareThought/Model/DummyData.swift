//
//  DummyData.swift
//  ShareThought
//
//  Created by Vishal M on 30/06/23.
//

import Foundation
struct DummyData: Codable, Identifiable {
    let id: [String] 
    let dummyData: [String]
    let image: [String]
    let names: [String]
    
    init(id: [String], dummyData: [String], image: [String], names: [String]) {
        self.id = id
        self.dummyData = dummyData
        self.image = image
        self.names = names
    }
}
