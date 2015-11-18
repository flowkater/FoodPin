//
//  Restaurant.swift
//  FoodPin
//
//  Created by flowkater on 2015. 11. 17..
//  Copyright © 2015년 flowkater. All rights reserved.
//

import Foundation

class Restaurant {
    var name:String?
    var type:String?
    var location:String?
    var phoneNumber:String?
    var image:String?
    var isVisited = false
    var rating:String?
    
    init(name: String, type: String, location: String, phoneNumber: String, image: String,isVisited: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.phoneNumber = phoneNumber
        self.image = image
        self.isVisited = isVisited
    }
}