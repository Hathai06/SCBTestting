//
//  HomeDetailPage.swift
//  SCBTestAssignment
//
//  Created by Nuan on 30/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import Foundation
import UIKit
class HomeDetailPage: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mycell = detailCollectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! showCollectionViewCell
        return mycell
    }
    
    
   
    
    override func viewDidLoad() {
          super.viewDidLoad()

      }
    
}
