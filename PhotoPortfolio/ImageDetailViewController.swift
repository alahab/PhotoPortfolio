//
//  ImageDetailViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 20/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController, UIScrollViewDelegate  {
    
    var albumNumber = 0
    
    var imageNumber = 0
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var imageView: UIImageView!
    
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

        //singleImage.image = UIImage(named: data[albumNumber][imageNumber]["image"]!)
        
        imageTitleLabel.text = data[albumNumber][imageNumber]["title"]
        
        imageDescriptionLabel.text = data[albumNumber][imageNumber]["text"]
    
        //println("second screen  imageNumber is \(imageNumber)")
        
        
        
               
        }
    
    
    override func viewDidLayoutSubviews() {
        // 1
        let image = UIImage(named: data[albumNumber][imageNumber]["image"]!)
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size:image!.size)
        scrollView.addSubview(imageView)
        
        
        
        // 2
        scrollView.contentSize = image!.size
        
        // 3
        var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        
        // 4
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight);
        scrollView.minimumZoomScale = minScale;
        
        // 5
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale;
        
        // 6
       // centerScrollViewContents()
    }
    
    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
            
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0 //- 50
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        println("boundsSize heght is \(boundsSize.height)")
        println("View heignt is \(view.frame.height)")
        println("x is \(contentsFrame.origin.x)")
        println("y is \(contentsFrame.origin.y)")
        
        
        imageView.frame = contentsFrame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
        // 1
        let pointInView = recognizer.locationInView(imageView)
        
        // 2
        var newZoomScale = scrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
        
        // 3
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w / 2.0)
        let y = pointInView.y - (h / 2.0)
        
        let rectToZoomTo = CGRectMake(x, y, w, h);
        
        // 4
        scrollView.zoomToRect(rectToZoomTo, animated: true)
    }
    
    
    //Functions needed for UIScrollViewController
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }
   
    
}
