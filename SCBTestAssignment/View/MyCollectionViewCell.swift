//
//  MyCollectionViewCell.swift
//  SCBTestAssignment
//
//  Created by Nuan on 31/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var ratingDetailLabel: UILabel!
    @IBOutlet weak var priceDetailLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
