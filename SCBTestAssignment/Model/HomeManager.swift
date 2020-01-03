//
//  HomeManager.swift
//  SCBTestAssignment
//
//  Created by Nuan on 30/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//

import Foundation
struct HomeManager {
    
    var homeUrl = "https://scb-test-mobile.herokuapp.com/api/mobiles/"
    
    func performRequest(completion: @escaping ([HomeData]?, Error?)->()) {
        
        if let url = URL(string: homeUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJson(data: safeData, completion: completion)
                }
            }
            task.resume()
        }
    }
    
    func detailPerformRequest(images: Int?,completion: @escaping ([DetailData]?, Error?)->()) {
        guard let images = images else {
            return
        }
        let urlDetail = homeUrl  + String(images) + "/images/"
        if let url = URL(string: (urlDetail)) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error)
                in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let helpData = data {
                    self.parseJson(data: helpData, completion: completion)
                }
            }
            task.resume()
        }
    }
    
    func parseJson<T>(data: Data?,completion: @escaping([T]?, Error?)->()) where T : Codable {
        
        var decodeData: [T]?
        var error: Error?
        
        guard let mobileData = data else {
            return
        }
        
        do {
            decodeData = try JSONDecoder().decode(Array<T>.self, from: mobileData)
            
            
        } catch let err {
            error = err
            debugPrint(err)
        }
        
        completion(decodeData, error)
    }
    
    
}
