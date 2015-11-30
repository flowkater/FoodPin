//
//  WalkthroughContentViewController.swift
//  FoodPin
//
//  Created by flowkater on 2015. 11. 20..
//  Copyright © 2015년 flowkater. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    @IBOutlet var headingLabel:UILabel!
    @IBOutlet var contentLabel:UILabel!
    @IBOutlet var contentImageView:UIImageView!
    @IBOutlet var pageControl:UIPageControl!
    @IBOutlet var forwardButton:UIButton!
    
    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imageFile)
        pageControl.currentPage = index
        
        if case 0...1 = index {
            forwardButton.setTitle("NEXT", forState: UIControlState.Normal)
        } else if case 2 = index {
            forwardButton.setTitle("DONE", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func nextButtonTapped(sender: UIButton){
        switch index {
        case 0...1:
            let pageViewController = parentViewController as! WalkthroughPageViewController
            pageViewController.forward(index)
        case 2:
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setBool(true, forKey: "hasViewedWalkthrough")
            dismissViewControllerAnimated(true, completion: nil)
        default: break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
