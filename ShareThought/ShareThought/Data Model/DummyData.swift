//
//  DummyData.swift
//  ShareThought
//
//  Created by Vishal M on 30/06/23.
//

import Foundation

class DummyData: Codable {
    let dummyData: [String]
    let image: [String]
    let names: [String]
    
    init(dummyData: [String], image: [String], names: [String]) {
        self.dummyData = dummyData
        self.image = image
        self.names = names
    }
}

