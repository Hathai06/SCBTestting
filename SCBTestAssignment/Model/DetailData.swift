//
//  DetailData.swift
//  SCBTestAssignment
//
//  Created by Nuan on 2/1/2563 BE.
//  Copyright © 2563 Hathairat. All rights reserved.
//

struct DetailData: Codable {
    let id: Int
    let url: String?
    let mobile_id: Int
    
    private enum CodingKeys : String, CodingKey {
           case id = "id"
           case url = "url"
           case mobile_id = "mobile_id"
       }    
}
