//
//  randomUser.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/27/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import Foundation

struct UserData: Codable {
    let results: [Users] // "results" represents the json array of stories
}


struct Users: Codable {
    let name: [String : String]
    let email: String
    let location: Location
    let phoneNumber: String
    let dob: DOB
    
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Postcode
}


struct Street: Codable {
    let number: Int
    let name: String
}

struct DOB: Codable {
    let date: String
    let age: Int
}

enum Postcode: Codable {
    func encode(to encoder: Encoder) throws {
        return
    }
    case int(Int), string(String)

    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }

        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }

        throw QuantumError.missingValue
    }

    enum QuantumError:Error {
        case missingValue
    }
    
    func extractValue() -> String {
        var result = ""
        switch self {
        case .int(let value):
            result = value.description
        case .string(let valueStr):
            result = valueStr
        }
        return result
    }
}

extension UserData {
    static func getUsers() -> [Users] {
        
        var userArr = [Users]()
        
        
        guard let fileURL = Bundle.main.url(forResource: "randomUser", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        
        do {
            let data = try Data(contentsOf: fileURL)
                        
            let userData = try JSONDecoder().decode(UserData.self, from: data)
            
            userArr = userData.results
        } catch {
            fatalError("contents failed to load \(error)")
        }
        
        return userArr
    }
}
