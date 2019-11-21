//
//  ViewController.swift
//  twentyoneplus
//
//  Created by Elsa Roeber on 10/1/19.
//  Copyright © 2019 Elsa Roeber. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    /////// outlets and actions //////////
    @IBOutlet weak var peopleCount: UITextField! // amount of people
    @IBOutlet weak var wildLevel: UILabel! // label for wildness level
    @IBOutlet weak var wildStepper: UIStepper! // outlet for stepper
    @IBAction func updateWild(_ sender: Any) { // action for stepper
        wildLevel.text = String(format: "%.0f", wildStepper.value) + " / 10"
        updateIngredients()
    }
    @IBOutlet weak var teqAmt: UILabel!
    @IBOutlet weak var limeJuiceAmt: UILabel!
    @IBOutlet weak var citrusAmt: UILabel!
    @IBOutlet weak var wedges: UILabel!
    
    // fix: make keyboard go down when tapping outside text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateIngredients(){
        var people : Float // number of people entered
        // var level : Float // wild level from 1 to 10
        
        if(peopleCount.text!.isEmpty){
            people = 0.0
        } else {
            people = Float(peopleCount.text!)!
        }
        
        let stepperValue = Float(wildStepper.value) // save value of stepper
        let level = 3*stepperValue/4
        let tequila = people*level
        let limeJuice = 2*tequila/3
        let citLiqueur = tequila/3
        let wedgeCount = people*2
        
        teqAmt.text = String(tequila)
        limeJuiceAmt.text = String(limeJuice)
        citrusAmt.text = String(citLiqueur)
        wedges.text = String(wedgeCount)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateIngredients()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

