//
//  ViewController.swift
//  pretty pixels
//
//  Created by Elsa Roeber on 9/22/19.
//  Copyright © 2019 Elsa Roeber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var pixelTitle: UILabel!
    @IBOutlet weak var pixelImage: UIImageView!
    @IBOutlet weak var titleLabel: UISegmentedControl!
    @IBOutlet weak var fontSizeNumber: UILabel!
    @IBOutlet weak var computerize: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    
    func switchImage(){
        if(titleLabel.selectedSegmentIndex == 0){
            pixelTitle.text = "surf"
            pixelImage.image = UIImage(named: "surf")
        } else if(titleLabel.selectedSegmentIndex == 1){
            pixelTitle.text = "turf"
            pixelImage.image = UIImage(named: "turf")
        }
    }
    
    @IBAction func changeViews(_ sender: UISegmentedControl){
        switchImage()
        computerizeView()
    }
    
    @IBAction func changeFontSize(_ sender: UISlider){
        let fontSize = sender.value
        fontSizeNumber.text = String(format: "%.0f", fontSize)
        
        let fontCGfloat = CGFloat(fontSize)
        pixelTitle.font = UIFont.systemFont(ofSize: fontCGfloat)
    }
    
    // function to change title to all caps, text color & background
    func computerizeView(){
        if computerize.isOn{
            pixelTitle.text = pixelTitle.text?.uppercased()
            pixelTitle.textColor = UIColor(red: 57/256, green: 225/256, blue: 20/256, alpha: 1.0)
            fontSizeNumber.textColor = UIColor(red: 57/256, green: 225/256, blue: 20/256, alpha: 1.0)
            switchLabel.textColor = UIColor(red: 57/256, green: 225/256, blue: 20/256, alpha: 1.0)
            self.view.backgroundColor = UIColor.black
        }else{
            pixelTitle.text = pixelTitle.text?.lowercased()
            pixelTitle.textColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 1.0)
            fontSizeNumber.textColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 1.0)
            switchLabel.textColor = UIColor(red: 0/256, green: 0/256, blue: 0/256, alpha: 1.0)
            self.view.backgroundColor = UIColor(red: 214/256, green: 220/256, blue: 252/256, alpha: 1.0)

        }
    }
    
    // function to call the computerize function
    @IBAction func updateComputerMode(_sender: UISwitch){
        computerizeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

