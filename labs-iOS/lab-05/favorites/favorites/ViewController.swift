//
//  ViewController.swift
//  favorites
//
//  Created by Elsa Roeber on 10/3/19.
//  Copyright © 2019 Elsa Roeber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    var user = Favorite()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        colorLabel.text = user.faveColor
        hexLabel.text = user.faveHex
    }


}

