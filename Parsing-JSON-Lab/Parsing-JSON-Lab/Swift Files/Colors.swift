//
//  Colors.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/27/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import Foundation

struct Colors: Codable {
    let name: String
    let rgb: [String : Double]
    let hexString: String
}


extension Colors {
    // parse the "topStoriesTechnology.json" into an array of [NewsHeadline] objects
    static func getColors() -> [Colors] {
        
        var color = [Colors]()
        
        
        guard let fileURL = Bundle.main.url(forResource: "Colors", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        
        do {
            let data = try Data(contentsOf: fileURL)
                        
            let colorData = try JSONDecoder().decode([Colors].self, from: data)
            color = colorData
            
        } catch {
            fatalError("contents failed to load \(error)")
        }
        
        return color
    }
}
