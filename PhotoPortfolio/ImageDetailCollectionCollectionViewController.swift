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
    
    //let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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
    
        return cell
    }
    
    
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        let cell: ImageDetailViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("imageDetailCell", forIndexPath: indexPath) as! ImageDetailViewCell
//    
//   
//    cell.DetailImageView.image = UIImage(named:data[albumNumber][imageNumber]["image"]!)
//    
//       println(cell.dynamicType)
//        
//    return cell
//    }
    
    
//    func collectionView(collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//            
//            width = view.frame.width
//            
//    return CGSize(width: width, height: )
//    
//    }
    
//    func collectionView(collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//    return sectionInsets
//    }
//    

  
}
