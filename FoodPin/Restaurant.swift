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
    var image:String?
    var isVisited = false
    
    init(name: String, type: String, location: String,image: String, isVisited: Bool){
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}