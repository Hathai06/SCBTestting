//
//  MyTableViewCell.swift
//  SCBTestAssignment
//
//  Created by Nuan on 29/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import UIKit
class MyTableViewCell: UITableViewCell {
    
    var indexPathOfCell: Int?
    
    @IBOutlet weak var mobiePhoneImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBAction func starHandle(_ sender: Any) {
        
        if let indexPathOfCell = indexPathOfCell {
           
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
