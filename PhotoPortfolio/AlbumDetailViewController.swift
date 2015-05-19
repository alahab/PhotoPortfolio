//
//  AlbumDetailViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 19/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var albumName = "test"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: AlbumDetailViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("AlbumDetailCell", forIndexPath: indexPath) as! AlbumDetailViewCell
        
        
        
        
        //cell.imgCell.image =  UIImage(named: data[indexPath.row][indexPath.row]["image"]!)
        //cell.lblCell.text = data[indexPath.row][indexPath.row]["album"]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            width = view.frame.width/2.02
            return CGSize(width: width, height: width)
            
    }
    
    
    

}
