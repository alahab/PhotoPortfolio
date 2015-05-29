//
//  ImageDetailCollectionCollectionViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 26/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

let reuseIdentifier = "imgDetailCell"

class ImageDetailCollectionViewController: UICollectionViewController,  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    
    override func viewDidLayoutSubviews() {
      
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


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
        
       
        
//        cell.frame.size.height = collectionView.frame.size.height
//        cell.DetailImageView.frame.size.height = collectionView.frame.size.height
        
        
        return cell
    }
 
   
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            var numberOfCellInRow : Int = 1
            var padding : Int = 0
            var collectionCellWidth : CGFloat = (self.view.frame.size.width/CGFloat(numberOfCellInRow)) - CGFloat(padding)
            
            //return CGSize(width: collectionCellWidth , height:collectionView.frame.size.height)
            
            
            
            //imageCollectionView.layoutIfNeeded()
            
            //return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height )
            
            //let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.height
            return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height //- navigationBarHeight
            )
        
    }
    
    
    
//    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval)
//    {
//        let currentPage = Int(collectionView!.contentOffset.x / collectionView!.bounds.size.width)
//        
//        var width = collectionView!.bounds.size.width
//        UIView.animateWithDuration(duration) {
//            self.collectionView!.setContentOffset(CGPointMake(width * CGFloat(currentPage), 0.0), animated: false)
//            self.collectionView!.collectionViewLayout.invalidateLayout()
//        }
//    
//    }

//    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
//        coordinator.animateAlongsideTransition(nil, completion: {context in
//            
//            if UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft || UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight {
//                
//               
//                
//            }
//        }
//        })
//
//}
//
//    
    
}
