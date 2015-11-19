//
//  AddRestaurantController.swift
//  FoodPin
//
//  Created by flowkater on 2015. 11. 19..
//  Copyright © 2015년 flowkater. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var typeTextField:UITextField!
    @IBOutlet var locationTextField:UITextField!
    @IBOutlet var yesButton:UIButton!
    @IBOutlet var noButton:UIButton!
    
    var isVisited = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save(){
        if nameTextField.text == "" {
            alertValidationMessage()
        } else if typeTextField.text == "" {
            alertValidationMessage()
        } else if locationTextField.text == "" {
            alertValidationMessage()
        } else {
            print("Name: \(nameTextField.text)")
            print("Type: \(typeTextField.text)")
            print("Location: \(locationTextField.text)")
            print("Have you been here: \(isVisited)")
            
            
            dismissViewControllerAnimated(true, completion: nil)
        }
        

    }
    
    func alertValidationMessage(){
        let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func toggleBeenHereButton(sender:UIButton){
        if sender == yesButton {
            isVisited = true
            yesButton.backgroundColor = UIColor.redColor()
            noButton.backgroundColor = UIColor.lightGrayColor()
        } else if sender == noButton {
            isVisited = false
            yesButton.backgroundColor = UIColor.lightGrayColor()
            noButton.backgroundColor = UIColor.redColor()
        }
    }
    
}
