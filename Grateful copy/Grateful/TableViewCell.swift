//
//  TableViewCell.swift
//  Grateful
//
//  Created by Elsa Roeber on 10/8/19.
//  Copyright © 2019 Elsa Roeber. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var newEntry: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newDate: UILabel!
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
