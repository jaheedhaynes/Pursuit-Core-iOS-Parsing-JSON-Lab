//
//  RectangleZoneWeather.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/26/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import Foundation

struct CitiesData: Codable {
    let list: [CityWeather] // "results" represents the json array of stories
}


struct CityWeather: Codable {
    let name: String
    let main: [String : Double]
    let weather: [Weather]
}

struct Weather: Codable {
    let description: String
}


extension CitiesData {
    // parse the "topStoriesTechnology.json" into an array of [NewsHeadline] objects
    static func getWeather() -> [CityWeather] {
        
        var weather = [CityWeather]()
        
        
        guard let fileURL = Bundle.main.url(forResource: "rectangleCitiesWeather", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        
        do {
            let data = try Data(contentsOf: fileURL)
                        
            let weatherData = try JSONDecoder().decode(CitiesData.self, from: data)
            
            weather = weatherData.list
        } catch {
            fatalError("contents failed to load \(error)")
        }
        
        
        
        return weather
    }
}
