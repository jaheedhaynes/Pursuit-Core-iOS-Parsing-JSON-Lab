//
//  RectangleZoneVC.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/26/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var citiesArr = [CityWeather]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        citiesArr = CitiesData.getWeather()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let weatherVC = segue.destination as? RectangleZoneDetailVC, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        weatherVC.cityWeather = citiesArr[indexPath.row]
    }
    
    
}

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        let weather = citiesArr[indexPath.row]
        
        cell.textLabel?.text = weather.name
        
        
        return cell
    }
    
    
}
