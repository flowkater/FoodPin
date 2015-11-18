//
//  RestaurantDetailTableViewCell.swift
//  FoodPin
//
//  Created by flowkater on 2015. 11. 17..
//  Copyright © 2015년 flowkater. All rights reserved.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {
    @IBOutlet var fieldLabel:UILabel!
    @IBOutlet var valueLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
