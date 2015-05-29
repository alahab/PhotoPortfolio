//
//  CreateAlbumViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 28/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

class CreateAlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var addNewImageView: UIView!
    
    @IBOutlet var albumNameTextField: UITextField!

    @IBOutlet var addNewImageButton: UIButton!
    
    @IBOutlet var albumNameTextFieldOutlet: UITextField!
    
    
    
    
    @IBAction func albumNameTextField(sender: AnyObject) {
        
      
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
