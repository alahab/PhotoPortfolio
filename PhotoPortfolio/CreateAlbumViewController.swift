//
//  CreateAlbumViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 28/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit


class CreateAlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var addNewImageView: UIView!
    
    @IBOutlet var albumNameTextField: UITextField!

    @IBOutlet var addNewImageButton: UIButton!
    
    @IBOutlet var albumNameTextFieldOutlet: UITextField!
    
    var newAlbumName = ""
   
    var imagePicker = UIImagePickerController()
    
    
    @IBAction func albumNameTextField(sender: AnyObject) {
        
      newAlbumName = albumNameTextFieldOutlet.text
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func addNewImageButtonTapped(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            println("Button capture")
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
        
        picker.dismissViewControllerAnimated(true, completion:nil)
        
        
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
            
   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumNameTextFieldOutlet.delegate = self
       

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
         
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return   1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
         let cell: AddNewImageInCreateAlbumCell = collectionView.dequeueReusableCellWithReuseIdentifier("AddNewImageCell", forIndexPath: indexPath) as! AddNewImageInCreateAlbumCell
        
        return cell
    }
    

    
}

