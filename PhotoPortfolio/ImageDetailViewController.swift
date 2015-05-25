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
   
    @IBOutlet var pageControl: UIPageControl!
    
    var pageImages = [UIImage]()
    var pageViews: [UIImageView?] = []

    
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
        
        //Paging
        
         //1
        
        var numberOfImagesPerALbum = data[albumNumber].count - 1
        
        for index in 0...numberOfImagesPerALbum {
            
            pageImages.append(UIImage(named: data[albumNumber][index]["image"]!)!)
            
            
        }
        
        
        
        
        
//        pageImages = [UIImage(named:"Bird_flying_over_the_water_Iceland.png")!,
//            UIImage(named:"ice_foe_iceland.png")!,
//            UIImage(named:"ice_in_nowray.png")!,
//            
//            UIImage(named:"polar_bear_walking_on_ice")!]
        
        var pageCount = pageImages.count
        
        
        // 2
        pageControl.currentPage = imageNumber
        println(imageNumber)
        
        pageControl.numberOfPages = pageCount
        
        // 3
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        
        // 4
        //let pagesScrollViewSize = scrollView.frame.size
        //scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), pagesScrollViewSize.height)
        //println("scrollView.frame.size is \(scrollView.frame.size)")
        // 5
       //loadVisiblePages()
        
        
               
        }
    
    override func viewDidLayoutSubviews() {
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), pagesScrollViewSize.height)
        println("scrollView.frame.size is \(scrollView.frame.size)")
        // 5
        loadVisiblePages()
    }
    
    
    
//    override func viewDidLayoutSubviews() {
//        // 1
//        let image = UIImage(named: data[albumNumber][imageNumber]["image"]!)
//        imageView = UIImageView(image: image)
//        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size:image!.size)
//        scrollView.addSubview(imageView)
//        
//        
//        
//        // 2
//        scrollView.contentSize = image!.size
//        
//        // 3
//        var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
//        doubleTapRecognizer.numberOfTapsRequired = 2
//        doubleTapRecognizer.numberOfTouchesRequired = 1
//        scrollView.addGestureRecognizer(doubleTapRecognizer)
//        
//        // 4
//        let scrollViewFrame = scrollView.frame
//        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
//        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
//        let minScale = min(scaleWidth, scaleHeight);
//        scrollView.minimumZoomScale = minScale;
//        
//        // 5
//        scrollView.maximumZoomScale = 1.0
//        scrollView.zoomScale = minScale;
//        
//        // 6
//       centerScrollViewContents()
//        
//        
//        
//    }
    
//    func centerScrollViewContents() {
//        let boundsSize = scrollView.bounds.size
//        var contentsFrame = imageView.frame
//        
//        if contentsFrame.size.width < boundsSize.width {
//            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
//            
//        } else {
//            contentsFrame.origin.x = 0.0
//        }
//        
//        if contentsFrame.size.height < boundsSize.height {
//            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0 //- 50
//        } else {
//            contentsFrame.origin.y = 0.0
//        }
////        
////        println("boundsSize heght is \(boundsSize.height)")
////        println("View heignt is \(view.frame.height)")
////        println("x is \(contentsFrame.origin.x)")
////        println("y is \(contentsFrame.origin.y)")
//        
//        
//        imageView.frame = contentsFrame
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
//        // 1
//        let pointInView = recognizer.locationInView(imageView)
//        
//        // 2
//        var newZoomScale = scrollView.zoomScale * 1.5
//        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
//        
//        // 3
//        let scrollViewSize = scrollView.bounds.size
//        let w = scrollViewSize.width / newZoomScale
//        let h = scrollViewSize.height / newZoomScale
//        let x = pointInView.x - (w / 2.0)
//        let y = pointInView.y - (h / 2.0)
//        
//        let rectToZoomTo = CGRectMake(x, y, w, h);
//        
//        // 4
//        scrollView.zoomToRect(rectToZoomTo, animated: true)
//    }
    
    
    //Functions needed for UIScrollViewController

    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // 1
        if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
            
        } else {
            // 2
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
             3
            let newPageView = UIImageView(image: pageImages[page])
            
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            
            
            scrollView.addSubview(newPageView)
            
            // 4
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisiblePages() {
        // First, determine which page is currently visible
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        println("Page is \(page)")
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for var index = firstPage; index <= lastPage; ++index {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Load the pages that are now on screen
        loadVisiblePages()
    }
    
}
