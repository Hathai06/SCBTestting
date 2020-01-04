//
//  MyTableViewCell.swift
//  SCBTestAssignment
//
//  Created by Nuan on 29/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import UIKit
protocol SentDataMobileDelagate {
    func sentDataMobile(indexPathOfCell: Int)
}
class MyTableViewCell: UITableViewCell {
    var delegate: SentDataMobileDelagate?
    var indexPathOfCell: Int?
    
    @IBOutlet weak var mobiePhoneImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    
    @IBAction func starHandle(_ sender: Any) {
        
        if favouriteButton.isSelected == true {
            favouriteButton.isSelected = false
            
        } else {
            favouriteButton.isSelected = true
        }
       
        if let indexPathOfCell = indexPathOfCell {
            delegate?.sentDataMobile(indexPathOfCell: indexPathOfCell)
        }
       
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
