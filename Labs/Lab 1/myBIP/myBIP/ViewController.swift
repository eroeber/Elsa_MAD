//
//  ViewController.swift
//  myBIP
//
//  Created by Elsa Roeber on 9/3/19.
//  Copyright © 2019 Elsa Roeber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var manPhoto: UIImageView!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func chooseMan(_ sender: UIButton) {
        if sender.tag == 1{ // foe button was tapped
            manPhoto.image = UIImage(named: "bad") // change image to cam
            helloLabel.text = "Both chaotic and bad" // cam's text
            nameLabel.text = "Cam, area enemy" // cam's nametag
        }
        else if sender.tag == 2{ // boyfriend button was tapped
            manPhoto.image = UIImage(named: "mike") // change image to mike
            helloLabel.text = "Unequivocally the best" // mike's text
            nameLabel.text = "Mike, area hero" // mike's nametage
        }
        else{ // essentaially homescreen, or if top button tapped
            manPhoto.image = UIImage(named: "chris") // change image to chris
            helloLabel.text = "Help me help you...." // chris's text
            nameLabel.text = "Chris Harrison, PhD" // chris's nametag
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

