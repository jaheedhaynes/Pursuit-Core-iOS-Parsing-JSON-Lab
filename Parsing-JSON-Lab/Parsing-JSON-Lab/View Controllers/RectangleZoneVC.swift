//
//  RectangleZoneVC.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/26/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class RectangleZoneVC: UIViewController {
    
    @IBOutlet weak var rectangleZoneTableview: UITableView!
    
    var weather = [RectangleZoneWeather]() {
        didSet {
            rectangleZoneTableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rectangleZoneTableview.dataSource = self
        
        loadData()
        
        
    }
    
    func loadData() {
        weather = WeatherData.getWeather()
    }
}




extension RectangleZoneVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        let weatherCell = weather[indexPath.row]
        
        cell.textLabel?.text = weatherCell.name
        
        return cell 
    }
}
