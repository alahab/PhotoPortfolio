//
//  ImageDetailCollectionCollectionViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 26/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

let reuseIdentifier = "imgDetailCell"

class ImageDetailCollectionCollectionViewController: UICollectionViewController,  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var albumNumber = 0
    var imageNumber = 0
    
    var pageImages = [UIImage]()
    
    @IBOutlet var imageCollectionView: UICollectionView!
    
    
    //let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCollectionView.layoutIfNeeded()
        
        var indexPath = NSIndexPath(forItem: imageNumber, inSection: 0)
        
        collectionView?.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func viewDidLayoutSubviews() {
//        
//        
//    
//        var indexPath = NSIndexPath(forItem: imageNumber, inSection: 0)
//    
//        collectionView?.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)//
//        
//
//    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return data[albumNumber].count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ImageDetailViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ImageDetailViewCell
        
        
        let curr = indexPath.row
        let imgName = data[albumNumber][curr]["image"]
        
        cell.DetailImageView.image = UIImage(named: imgName!)
        
//        let size = cell.DetailImageView.image?.size
//        
//        let imageWidth = size?.width
//        
//        let imageHeight = size?.height
//        
//        let aspectratio = imageWidth! / imageHeight!
//        
//        //let newSize = CGSize(width: view.frame.width, height: imageHeight! / aspectratio )
//        
//        let newSize = CGSize(width: 100, height: 100)
//        
//        cell.sizeThatFits(newSize)
        
        return cell
    }
    
   
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            var numberOfCellInRow : Int = 1
            var padding : Int = 0
            var collectionCellWidth : CGFloat = (self.view.frame.size.width/CGFloat(numberOfCellInRow)) - CGFloat(padding)
            return CGSize(width: collectionCellWidth , height: collectionCellWidth)
            
        
    }
    
    extension UINavigationController {
        public override func supportedInterfaceOrientations() -> Int {
            return visibleViewController.supportedInterfaceOrientations()
        }
        public override func shouldAutorotate() -> Bool {
            return visibleViewController.shouldAutorotate()
        }
    }
    
    class ViewController: UIViewController {
        override func shouldAutorotate() -> Bool {
            return true
        }
    }
    
  
    
  
}
