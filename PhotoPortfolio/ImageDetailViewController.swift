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
        
        //println("second screen  imageNumber is \(imageNumber)")
        
        
        
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
