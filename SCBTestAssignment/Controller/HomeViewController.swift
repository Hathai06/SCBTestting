//
//  ViewController.swift
//  SCBTestAssignment
//
//  Created by Nuan on 29/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    private var homeManager = HomeManager()
    private var homeData = [HomeData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        requestData()
        tableView.register(UINib(nibName: "MyViewCell", bundle: nil), forCellReuseIdentifier: "MyViewCell")
    }
    
    @objc
    private func requestData() {
        homeManager.performRequest() { [weak self] (data, error) in
            
            guard let weakSelf = self else {
                return
            }
            if let data = data {
                
                weakSelf.homeData = data
            
                DispatchQueue.main.async {
                    weakSelf.tableView.reloadData()
                    print(data)
                }
                
            } else {
                print(error!)
            }
        }
    }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyViewCell") as! MyTableViewCell
        let mobie = homeData[indexPath.row]
        cell.nameLabel.text = mobie.name
        cell.descriptionLabel.text = mobie.description
        cell.mobiePhonImage.performImageRequest(thumbImageURL: mobie.thumbImageURL)
        cell.priceLabel.text = String(mobie.price)
        cell.ratingLabel.text = String(mobie.rating)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "homeDetailView") as! HomeDetailPage
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
