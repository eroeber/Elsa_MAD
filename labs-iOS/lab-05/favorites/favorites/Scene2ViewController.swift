//
//  Scene2ViewController.swift
//  favorites
//
//  Created by Elsa Roeber on 10/3/19.
//  Copyright © 2019 Elsa Roeber. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userColor: UITextField!
    @IBOutlet weak var userHex: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneAdding"{
            let scene1ViewController = segue.destination as! ViewController
            
            if userColor.text!.isEmpty == false{
                scene1ViewController.user.faveColor = userColor.text
            }
            if userHex.text!.isEmpty == false{
                scene1ViewController.user.faveHex = userHex.text
            }
        }
    }
    
    override func viewDidLoad() {
        userColor.delegate = self
        userHex.delegate = self
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
