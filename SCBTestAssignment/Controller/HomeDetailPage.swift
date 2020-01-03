//
//  HomeDetailPage.swift
//  SCBTestAssignment
//
//  Created by Nuan on 30/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import Foundation
import UIKit
class HomeDetailPage: UIViewController {
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var homeManager = HomeManager()
    private var detailData = [DetailData]()
    
    var getDataDetail: HomeData? {
         didSet {
             guard getDataDetail != nil else {
                 return
             }
            detailRequestData()
         }
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        
        if let getDataDetail = getDataDetail {
            ratingLabel.text = String(getDataDetail.rating)
            priceLabel.text = String(getDataDetail.price)
            descriptionLabel.text = getDataDetail.description
        }
    }
    @objc
    private func detailRequestData() {
        homeManager.detailPerformRequest(images: getDataDetail?.id) { [weak self] (data, error) in
            
            guard let weakSelf = self else {
                return
            }
            
            if let data = data {
                
                weakSelf.detailData = data
            
                DispatchQueue.main.async {
                    weakSelf.detailCollectionView.reloadData()
                    print(data)
                }
                
            } else {
                print(error!)
            }
        }
    }
}

extension HomeDetailPage: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mycell = detailCollectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! showCollectionViewCell
//        let myMobie = detailData[indexPath.row]
    
        
        
    
        return mycell
    }
    
}
