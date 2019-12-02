//
//  RectangleZoneDetailVC.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/27/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class WeatherDetailController: UIViewController {
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var cityWeather: CityWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        guard let validWeather = cityWeather else {
            fatalError("could not load weather")
        }
        navigationItem.title = validWeather.name
        tempLabel.text = "Tempurature: \(validWeather.main["temp"]?.description ?? "0")"
        weatherLabel.text = "Weather: \(validWeather.weather[0].description)"
    }
    

}
