//
//  HomeData.swift
//  SCBTestAssignment
//
//  Created by Nuan on 30/12/2562 BE.
//  Copyright © 2562 Hathairat. All rights reserved.
//
struct HomeData: Codable {
    let id : Int
    let brand : String?
    let name : String?
    let description : String?
    let price : Int
    let thumbImageURL : [String]?
    let rating : Int
    
    private enum CodingKeys : String, CodingKey {
        case id = "id"
        case brand = "brand"
        case name = "name"
        case description = "description"
        case price = "price"
        case thumbImageURL = "thumbImageURL"
        case rating = "rating"
        
       }
}
