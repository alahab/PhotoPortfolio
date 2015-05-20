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
    
    var albumNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()

       self.title = albumName
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[albumNumber].count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: AlbumDetailViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("AlbumDetailCell", forIndexPath: indexPath) as! AlbumDetailViewCell
        
        
        cell.albumImageView.image =  UIImage(named: data[albumNumber][indexPath.row]["image"]!)
        //cell.lblCell.text = data[indexPath.row][indexPath.row]["album"]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            width = view.frame.width/2
            return CGSize(width: width, height: width)
            
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("fromAlbumToSingleImage", sender: self)
        
    }

    
    
    

}
