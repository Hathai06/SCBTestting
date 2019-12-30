//
//  HomeDetailPage.swift
//  SCBTestAssignment
//
//  Created by Nuan on 30/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import Foundation
import UIKit
class HomeDetailPage: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 3
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = showCollectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath)as! DetailCollectionViewCell
          return cell
      }
    
    
    @IBOutlet weak var titleLabel: UINavigationBar!
    @IBOutlet weak var showCollectionView: UICollectionView!
    
    override func viewDidLoad() {
          super.viewDidLoad()

      }
    
}
