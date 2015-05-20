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
    
    @IBAction func infoButton(sender: AnyObject) {
        
        insertBlurView(singleImage, UIBlurEffectStyle.Dark)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        singleImage.image = UIImage(named: data[albumNumber][imageNumber]["image"]!)
        
        println("second screen  imageNumber is \(imageNumber)")
        
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
