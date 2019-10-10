//
//  ViewController.swift
//  Grateful
//
//  Created by Elsa Roeber on 10/7/19.
//  Copyright © 2019 Elsa Roeber. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var gratitudeTable: UITableView!
    
    var  user = Entries()
    var scene2 = scene2viewConroller()
    
    
    let cellID = "cellID"
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        gratitudeTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.newArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "betterCell") as? TableViewCell else {return UITableViewCell()}
        
        cell.newEntry.text = user.newArray[indexPath.row]  // this will add text to individual cell
        cell.newDate.text = user.dateChoice[indexPath.row] // this will add date to individual cell

        switch user.pickerChoice!{ // this will change the image in all cells
        case 0...3:
            cell.newImage.image = UIImage(named: "sun-yellow-10.png")
        case 4...8:
            cell.newImage.image = UIImage(named: "sun-green-11.png")
        case 9...12:
            cell.newImage.image = UIImage(named: "sun-teal-12.png")
        case 13...16:
            cell.newImage.image = UIImage(named: "sun-blue-13.png")
        case 17...20:
            cell.newImage.image = UIImage(named: "sun-red-14.png")
        case 21...25:
            cell.newImage.image = UIImage(named: "sun-orange-15.png")
        default:
            cell.newImage.image = UIImage(named: "sun-yellow-10.png")
       
    }
     return cell
}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        gratitudeTable.dataSource = self
        gratitudeTable.delegate = self
    }


}

