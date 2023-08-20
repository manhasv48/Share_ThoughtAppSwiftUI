//
//  LoadLocalJson.swift
//  ShareThought
//
//  Created by Vishal M on 20/08/23.
//

import Foundation

// 1. Create a protocol for your custom Decodable extension
protocol LocalJSONLoadable: Decodable {
    static func loadFromLocalJSON(fileName: String) throws -> Self
}

extension LocalJSONLoadable {
    // 2. Add a method to load local JSON data
    static func loadFromLocalJSON(fileName: String) throws -> Self {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: "YourAppErrorDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "File not found"])
        }
        
        let data = try Data(contentsOf: url)
        let decoded = try JSONDecoder().decode(Self.self, from: data)
        return decoded
    }
}
