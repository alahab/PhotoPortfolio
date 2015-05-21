//
//  ImageDetailViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 20/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    var albumNumber = 0
    
    var imageNumber = 0
    
    var imageIndex: Int = 0
    
    var maxImages = 0
    
    @IBOutlet var singleImage: UIImageView!
    
    @IBOutlet var maskButton: UIButton!
    
    @IBOutlet var descriptionView: UIView!
    
    @IBOutlet var imageTitleLabel: UILabel!
    
    @IBOutlet var imageDescriptionLabel: UILabel!
   
    
    
    @IBAction func maskButtonDidPress(sender: AnyObject) {
        
        spring(0.5) {
            self.maskButton.alpha = 0
        }
        
        descriptionView.hidden = true

    }
    
    func showMask() {
        self.maskButton.hidden = false
        self.maskButton.alpha = 0
        spring(0.5) {
            self.maskButton.alpha = 1
        }
    }
    
    @IBAction func infoButton(sender: AnyObject) {
        
        let scale = CGAffineTransformMakeScale(0.3, 0.3)
        let translate = CGAffineTransformMakeTranslation(100, 200)
        descriptionView.transform = CGAffineTransformConcat(scale, translate)
        //descriptionView.alpha = 0
        
        showMask()
        
        spring(0.5) {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.descriptionView.transform = CGAffineTransformConcat(scale, translate)
            self.descriptionView.alpha = 1
        }
        
       self.descriptionView.hidden = false
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        singleImage.image = UIImage(named: data[albumNumber][imageNumber]["image"]!)
        
        imageTitleLabel.text = data[albumNumber][imageNumber]["title"]
        
        imageDescriptionLabel.text = data[albumNumber][imageNumber]["text"]
        
       
        //FIX MAXIMAGES///////////////////
        maxImages = data[albumNumber].count - 1

        
        //println("second screen  imageNumber is \(imageNumber)")
        
        //CHANGE IMAGE ON SWIPE
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:") // put : at the end of method name
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:") // put : at the end of method name
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    //CHANGE IMAGES ON SWIPE
    
    func swiped(gesture: UIGestureRecognizer) {
        
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Right :
                println("User swiped right")
                
                // decrease index first
                
                imageIndex--
                println("imageIndex is \(imageIndex)")
                 println("maxImages is \(maxImages)")
                
                // check if index is in range
                
                if imageIndex < 0 {
                    
                    imageIndex = maxImages
                    
                }
                
                
                
                singleImage.image = UIImage(named: data[albumNumber][imageIndex]["image"]!)
                imageTitleLabel.text = data[albumNumber][imageIndex]["title"]
                
                imageDescriptionLabel.text = data[albumNumber][imageIndex]["text"]
                
            case UISwipeGestureRecognizerDirection.Left:
                println("User swiped Left")
                
                // increase index first
                
                imageIndex++
                 println("imageIndex is \(imageIndex)")
                println("maxImages is \(maxImages)")
                // check if index is in range
                
                if imageIndex > maxImages {
                    
                    imageIndex = 0
                    
                }
                
                singleImage.image = UIImage(named: data[albumNumber][imageIndex]["image"]!)
                
                imageTitleLabel.text = data[albumNumber][imageIndex]["title"]
                
                imageDescriptionLabel.text = data[albumNumber][imageIndex]["text"]
                
                
            default:
                break //stops the code/codes nothing.
                
                
            }
            
        }
        
        
    }
    
    
}
