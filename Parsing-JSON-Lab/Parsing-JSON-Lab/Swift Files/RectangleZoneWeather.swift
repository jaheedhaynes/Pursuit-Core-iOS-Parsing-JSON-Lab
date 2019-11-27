//
//  RectangleZoneWeather.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/26/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [RectangleZoneWeather]
}

struct RectangleZoneWeather: Codable {
    let name: String
    let main: [String : Double]
    let weather: [Weather]
    
}

struct Weather: Codable {
    let description: String
}

extension WeatherData {
    static func getWeather() -> [RectangleZoneWeather] {
        var weather = [RectangleZoneWeather]()
        guard let fileURL = Bundle.main.url(forResource: "RectangleZone", withExtension: "json")
            else {
            fatalError("YOU DONT HAVE NO JSON SON 🤯")
        }
        do {
            let data = try Data(contentsOf: fileURL)

            
            let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            
            weather = weatherData.list
            
        } catch {
            print("\(error)")
        }
        return weather
    }
}
