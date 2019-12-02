//
//  ColorsVC.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/26/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class ColorsVC: UIViewController {
    
    @IBOutlet weak var colorTableView: UITableView!
    
    var colorsArr = [Colors]() {
        didSet {
            colorTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        colorsArr = Colors.getColors()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let colorVC = segue.destination as? ColorsDetailVC, let indexPath = colorTableView.indexPathForSelectedRow else {
            return
        }

        colorVC.color = colorsArr[indexPath.row]
    }
    
    
}

extension ColorsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colorsArr[indexPath.row]
        
        guard let r = color.rgb["r"], let g = color.rgb["g"], let b = color.rgb["b"] else {
            fatalError()
        }
        
        cell.textLabel?.text = color.name
        cell.backgroundColor? = UIColor(displayP3Red: CGFloat(r / 255), green: CGFloat(g / 255), blue: CGFloat(b / 255), alpha: 1.0)
        
        
        return cell
    }
    
    
}
