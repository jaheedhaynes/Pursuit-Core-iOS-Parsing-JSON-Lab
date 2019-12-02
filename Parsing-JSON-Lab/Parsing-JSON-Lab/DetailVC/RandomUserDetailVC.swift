//
//  RandomUserDetailVC.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/27/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class RandomUserDetailVC: UIViewController {
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var numberNumberLabel: UILabel!
    
    var randomUserSelection: Users?
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func getDateFromString(dateString: String) -> Date? {
      let dateFormatter = ISO8601DateFormatter()
      dateFormatter.formatOptions = [.withInternetDateTime,
                                 .withDashSeparatorInDate,
                                 .withFullDate,
                                 .withFractionalSeconds,
                                 .withColonSeparatorInTimeZone]
      guard let date = dateFormatter.date(from: dateString) else {
        return nil
      }
      return date
    }
    
    func updateUI() {
        guard let validUser = randomUserSelection else {
            fatalError("could not load user")
        }
        
        addressLabel.text = """
        \(validUser.name["last"] ?? ""), \(validUser.name["first"] ?? "") - \(validUser.dob.age.description)
        
        \(validUser.location.street.number.description) \(validUser.location.street.name)
        \(validUser.location.city), \(validUser.location.state), \(validUser.location.country) \(validUser.location.postcode.extractValue())
        """
        guard let date = getDateFromString(dateString: validUser.dob.date) else {
            return
        }
        
        birthdayLabel.text = dateFormatter.string(from: date)
        
        numberNumberLabel.text = "Phone: \(validUser.phoneNumber)"
        
    }
    
}

