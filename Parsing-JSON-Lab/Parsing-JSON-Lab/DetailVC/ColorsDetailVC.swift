//
//  ColorsDetailVC.swift
//  Parsing-JSON-Lab
//
//  Created by Jaheed Haynes on 11/27/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class ColorsDetailVC: UIViewController {

    @IBOutlet weak var rgbLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    var color: Colors?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    func updateUI() {
        guard let validColor = color, let r = validColor.rgb["r"], let g = validColor.rgb["g"], let b = validColor.rgb["b"] else {
            fatalError("color could not be identified")
        }
        navigationItem.title = validColor.name
        rgbLabel.text = "RGB: \(Int(r)), \(Int(g)), \(Int(b))"
        var hex = validColor.hexString
        hex.removeFirst()
        hexLabel.text = "Hex: \(hex.lowercased())"
    }
    

}
