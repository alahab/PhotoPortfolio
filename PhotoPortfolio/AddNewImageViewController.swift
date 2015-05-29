//
//  AddNewImageViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 29/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

class AddNewImageViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var newImageViewinAddNewInage: UIImageView!
    
    @IBOutlet var imageTitleTextField: UITextField!
    
    @IBOutlet var imageDescriptionTextField: UITextField!
    
    var pickedImg = UIImage(named: "")
    
    var newAlbumDictionary = ["":""]
    
    
    
    @IBAction func addImageButoonPressed(sender: AnyObject) {
        
        
        
        self.performSegueWithIdentifier("fromAddNewImageToAddNewAlbum", sender: self)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTitleTextField.delegate = self
        
        imageDescriptionTextField.delegate = self
        
        newImageViewinAddNewInage.image = pickedImg
        
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "fromAddNewImageToAddNewAlbum" {
            
            var createAlbumViewController = segue.destinationViewController as! CreateAlbumViewController
            
            
        }
    }
   
}
