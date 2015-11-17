//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by flowkater on 2015. 11. 17..
//  Copyright © 2015년 flowkater. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var restaurantNameLabel:UILabel!
    @IBOutlet var restaurantTypeLabel:UILabel!
    @IBOutlet var restaurantLocationLabel:UILabel!
    
    var restaurant:Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurant.image!)
        restaurantNameLabel.text = restaurant.name
        restaurantLocationLabel.text = restaurant.location
        restaurantTypeLabel.text = restaurant.type
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
