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
    var favourite = [HomeData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        setUp ()
    }
    
    func setUp () {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MyViewCell", bundle: nil), forCellReuseIdentifier: "MyViewCell")
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    @IBAction func sortHandle(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Sort", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Price low to high", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction!) in
            self.homeData = self.homeData.sorted() { $0.price < $1.price }
            self.favourite = self.favourite.sorted() { $0.price < $1.price }
            
            self.tableView.reloadData();
        }))
        
        alert.addAction(UIAlertAction(title: "Price high to low", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
            self.homeData = self.homeData.sorted() { $0.price > $1.price }
            self.favourite = self.favourite.sorted() { $0.price > $1.price }
            self.tableView.reloadData();
            
        }))
        
        alert.addAction(UIAlertAction(title: "Rating", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in
            self.homeData = self.homeData.sorted(){ $0.rating > $1.rating }
            self.favourite = self.favourite.sorted(){ $0.rating > $1.rating }
            self.tableView.reloadData();
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
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
                }
                
            } else {
                print(error!)
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if  segmentControl.selectedSegmentIndex == 0 {
            
            return homeData.count
            
        } else if segmentControl.selectedSegmentIndex == 1 {
            
            return favourite.count
            
        } else {
            return homeData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyViewCell") as! MyTableViewCell
        
        if segmentControl.selectedSegmentIndex == 0 {
            if (homeData.count > 0) {
                let mobie = homeData[indexPath.row]
                cell.favouriteButton.isHidden = false
                cell.favouriteButton.isSelected = favourite.contains(where: {$0.id == mobie.id})
                cell.nameLabel.text = mobie.name
                cell.descriptionLabel.text = mobie.description
                cell.mobiePhoneImage.performImageRequest(thumbImageURL: mobie.thumbImageURL)
                cell.priceLabel.text = "Price: $" + String(mobie.price)
                cell.ratingLabel.text = "Rating: " + String(mobie.rating)
                cell.indexPathOfCell = indexPath.row
                cell.delegate = self
            }
            
        } else if segmentControl.selectedSegmentIndex == 1 {
            if (favourite.count > 0) {
                let favouriteLike = favourite[indexPath.row]
                cell.favouriteButton.isHidden = true
                cell.nameLabel.text = favouriteLike.name
                cell.descriptionLabel.text = favouriteLike.description
                cell.mobiePhoneImage.performImageRequest(thumbImageURL: favouriteLike.thumbImageURL)
                cell.priceLabel.text = "Price: $" + String(favouriteLike.price)
                cell.ratingLabel.text = "Rating: " + String(favouriteLike.rating)
                cell.indexPathOfCell = indexPath.row
                cell.delegate = self
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "homeDetailView") as! HomeDetailPage
        vc.getDataDetail = homeData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        if segmentControl.selectedSegmentIndex == 0 {
            return false
        } else if  segmentControl.selectedSegmentIndex == 1 {
            return true
        } else {
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            favourite.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

extension HomeViewController : SentDataMobileDelagate {
    func sentDataMobile(indexPathOfCell: Int) {
        if let index = favourite.firstIndex(where: {$0.id == homeData[indexPathOfCell].id}){
            favourite.remove(at: index)
            
        } else {
            favourite.append(homeData[indexPathOfCell])
        }
    }
}
