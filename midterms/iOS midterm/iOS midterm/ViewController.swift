//
//  ViewController.swift
//  iOS midterm
//
//  Created by Elsa Roeber on 10/15/19.
//  Copyright © 2019 Elsa Roeber. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // outlets and actions
    @IBOutlet weak var mileCount: UITextField! // user types in length of commute
    @IBOutlet weak var commuteTime: UILabel! // to be calulated:  total minutes they will be driving
    @IBOutlet weak var gasNeeded: UILabel!  // to be calculated: total gas needed for commute
    @IBAction func calculateButton(_ sender: Any) { // button prompts calculations
        updateInfo()
        dismissKeyboard()
    }
    
    @IBOutlet weak var gasTank: UILabel!  // displays slider value
    @IBOutlet weak var sliderVal: UISlider! // slider of gas already in tank
    @IBAction func gasSlider(_ sender: Any) { // update gasTank label
        updateTank()
    }
    
    @IBOutlet weak var monthSwitch: UISwitch! // toggle the month calculation on and off
    @IBAction func timeLength(_ sender: UISwitch) { //  when toggled, recalculate info
        updateInfo()
    }
    
    
    @IBOutlet weak var transitType: UISegmentedControl! // choose between car, bus, bike
    @IBOutlet weak var typePic: UIImageView! // icon will change with segmented view
    
    // dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // function to change image icon based on segmented control selection
    func switchImage(){
        if(transitType.selectedSegmentIndex == 0){
            typePic.image = UIImage(named: "car_icon.png")
        } else if(transitType.selectedSegmentIndex == 1){
            typePic.image = UIImage(named: "bus_icon.png")
        } else if(transitType.selectedSegmentIndex == 2){
            typePic.image = UIImage(named: "bike_icon.png")
        }
    }
    
    // segmented control calls switchImage function and recalculates info
    @IBAction func changePic(_ sender: UISegmentedControl) {
        switchImage()
        updateInfo()
    }
    
    // update gasTank label with slider value
    func updateTank(){
        gasTank.text = String(format: "%.0f", sliderVal.value) + " gal"
    }
    
    // here is where the main calculations happen
    func updateInfo(){
        var distance : Float
        
        // check to see if anything has been entered
        if(mileCount.text!.isEmpty){
            distance = 0.0
        } else {
            distance = Float(mileCount.text!)!
        }
        
        // basic calculations for car and monthSwitch untoggled:
        var timeResult = (distance/20)*60
        var gasAmount =  distance/24
        
        // change calculations based on type segmented control
        if(transitType.selectedSegmentIndex == 0){
            timeResult = (distance/20)*60
            gasAmount =  distance/24
        } else if(transitType.selectedSegmentIndex == 1){
            timeResult = (distance/12)*60 + 10
            gasAmount = 0
        } else if(transitType.selectedSegmentIndex == 2){
            timeResult = (distance/10)*60
            gasAmount = 0
        }
        
        // multiply values by 20 if monthSwitch is toggled
        if monthSwitch.isOn{
            timeResult = timeResult*20
            gasAmount = gasAmount*20
        } else{
            timeResult = timeResult*1
            gasAmount = gasAmount*1
        }
        
        // add values to commuteTime and gasNeeded textfields
        commuteTime.text = String(format: "%.0f", timeResult)  + " minutes"
        gasNeeded.text = String(format: "%.0f", gasAmount) + " gal"
        
        // alert to warn user  if they need more gas for their commute than they currently have
        if(sliderVal.value <= gasAmount){
            // create alert because it has to be between 1 and 10
            let alert = UIAlertController(title: "Warning", message: "You do not have enough gas to make commute, look at amount to purchase box!", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,
                                         handler: nil)
            alert.addAction(okAction)
            present(alert, animated:true, completion:nil)
        }
        
    }
    
    // recalculate info if month switch is toggled
    @IBAction func updateCalc(_ sender: UISwitch) {
        updateInfo()
    }
    
    // recalculate info if return button is tapped
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateInfo()
    }
    
    override func viewDidLoad() {
       mileCount.delegate = self
        
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

