//
//  ViewController.swift
//  SCBTestAssignment
//
//  Created by Nuan on 29/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    private var homeManager = HomeManager()
    private var homeData = [HomeData]()
    private var refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MyViewCell", bundle: nil), forCellReuseIdentifier: "MyViewCell")
        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
              tableView.refreshControl = refreshControl
    }
    
    @objc func reload () {
        homeData.removeAll()
        requestData()
    }

    @objc
    private func requestData() {
        
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyViewCell") as! MyTableViewCell
        return cell
    }
    
    
}

