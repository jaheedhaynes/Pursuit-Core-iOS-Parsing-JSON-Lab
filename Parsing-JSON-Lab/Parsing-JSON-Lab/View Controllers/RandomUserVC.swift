//
//  RandomUserVC.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/26/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class RandomUserVC: UIViewController {
    @IBOutlet weak var randomUserTableView: UITableView!
    
    var userArr = [Users]() {
        didSet {
            randomUserTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomUserTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        userArr = UserData.getUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let userVC = segue.destination as? RandomUserDetailVC, let indexPath = randomUserTableView.indexPathForSelectedRow else {
            return
        }

        userVC.randomUserSelection = userArr[indexPath.row]
    }
    
    
}

extension RandomUserVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        
        let user = userArr[indexPath.row]
        
        cell.textLabel?.text = "\(user.name["last"] ?? ""), \(user.name["first"] ?? "")"
        cell.detailTextLabel?.text = user.email
        
        
        return cell
    }
    
    
}
