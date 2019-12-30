//
//  MyCollectionViewCell.swift
//  SCBTestAssignment
//
//  Created by Nuan on 31/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var ratingDetailLabel: UILabel!
    @IBOutlet weak var priceDetailLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var widthConstraints: NSLayoutConstraint!
    override func awakeFromNib() {
      
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraints.constant = screenWidth - (2*12)
    }

}
