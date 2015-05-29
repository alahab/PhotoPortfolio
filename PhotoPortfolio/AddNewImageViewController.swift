//
//  AddNewImageViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 29/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

class AddNewImageViewController: UIViewController {
    
    @IBOutlet var newImageViewinAddNewInage: UIImageView!
    
    @IBOutlet var imageTitleTextField: UITextField!
    
    @IBOutlet var imageDescriptionTextField: UITextField!
    
    var pickedImg = UIImage(named: "")
    
    @IBAction func addImageButoonPressed(sender: AnyObject) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    newImageViewinAddNewInage.image = pickedImg

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
