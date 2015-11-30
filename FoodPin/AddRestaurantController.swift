//
//  AddRestaurantController.swift
//  FoodPin
//
//  Created by flowkater on 2015. 11. 19..
//  Copyright © 2015년 flowkater. All rights reserved.
//

import UIKit
import CoreData

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var typeTextField:UITextField!
    @IBOutlet var locationTextField:UITextField!
    @IBOutlet var phoneNumberTextField:UITextField!
    @IBOutlet var yesButton:UIButton!
    @IBOutlet var noButton:UIButton!
    
    var restaurant:Restaurant!
    
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
        let name = nameTextField.text
        let type = typeTextField.text
        let location = locationTextField.text
        let phoneNumber = phoneNumberTextField.text
        
        if name == "" {
            alertValidationMessage()
        } else if type == "" {
            alertValidationMessage()
        } else if location == "" {
            alertValidationMessage()
        } else {
            print("Name: \(nameTextField.text)")
            print("Type: \(typeTextField.text)")
            print("Location: \(locationTextField.text)")
            print("Have you been here: \(isVisited)")
            
            if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
                restaurant =
                NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext: managedObjectContext) as! Restaurant
                restaurant.name = name!
                restaurant.type = type!
                restaurant.location = location!
                restaurant.phoneNumber = phoneNumber!
                if let restaurantImage = imageView.image {
                    restaurant.image = UIImagePNGRepresentation(restaurantImage)
                }
                restaurant.isVisited = isVisited
                
                do {
                    try managedObjectContext.save()
                    print("success")
                } catch {
                    print(error)
                    return
                }
            }
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
