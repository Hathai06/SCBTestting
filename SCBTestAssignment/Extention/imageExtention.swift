//
//  imageExtention.swift
//  SCBTestAssignment
//
//  Created by Nuan on 30/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func performImageRequest(thumbImageURL: String?) {
        
        guard let imageUrl = thumbImageURL else {
            return
        }
        
        let url: URL?
        
        if imageUrl.hasPrefix("https://") || imageUrl.hasPrefix("http://") {
            
            url = URL(string: imageUrl)
        }
        else {
            
            url = URL(string: "https://" + imageUrl)
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { (data, response, error)
            in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard response != nil else {
                print("no response")
                return
            }
            
            guard let data = data else {
                print("no data")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}


