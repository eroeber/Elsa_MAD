//
//  scene2viewController.swift
//  Grateful
//
//  Created by Elsa Roeber on 10/7/19.
//  Copyright © 2019 Elsa Roeber. All rights reserved.
//

import UIKit


class scene2viewConroller: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextViewDelegate{
    
    @IBOutlet weak var gratefulEntry: UITextView!
    @IBOutlet weak var saveButton: UIButton!

    var pickerNum = 1
    var cellPic : UIImage!
    var dateText : String!
    
//    func textViewShouldReturn(_ textView: UITextView) -> Bool {
//        textView.resignFirstResponder()
//        return true
//    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    @IBOutlet weak var moodPicker: UIPickerView!
    var pickerData: [String] = [String]()
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        pickerNum = moodPicker.selectedRow(inComponent: component)
        
        return pickerData[row]
    }
    
    // used this tutorial for the date picker text field: https://www.youtube.com/watch?v=aa-lNWUVY7g
    @IBOutlet weak var dateTextField: UITextField!
    private var datePicker: UIDatePicker?
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneAdding"{
            let scene1ViewController = segue.destination as! ViewController
            scene1ViewController.user.newArray.append(String(gratefulEntry.text))
            scene1ViewController.user.pickerChoice = pickerNum
            scene1ViewController.user.dateChoice.append(dateTextField.text!)
        }
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        
        view.endEditing(true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        gratefulEntry.delegate = self
        moodPicker.delegate = self
        moodPicker.dataSource = self
        pickerData = ["love", "peaceful", "affectionate", "tenderness",
                      "joy", "content", "happy", "cheerful", "proud", "surprise",
                      "overwhelmed", "confused", "moved", "sad", "shameful", "neglected", "despair", "anger", "envy", "irritable",
                      "rage", "fear", "nervous", "insecure", "helpless", "worried"
        ]
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        let tapOutside = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapOutside)
        
        dateTextField.inputView = datePicker
        dateText = dateTextField.text
    
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if gratefulEntry.isEditable == true{
            gratefulEntry.isEditable = false
            gratefulEntry.isEditable = true
        } else {
            gratefulEntry.isEditable = true
        }
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}


