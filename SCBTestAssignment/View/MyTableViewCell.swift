//
//  MyTableViewCell.swift
//  SCBTestAssignment
//
//  Created by Nuan on 29/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import UIKit
class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mobiePhonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var starSelected: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
