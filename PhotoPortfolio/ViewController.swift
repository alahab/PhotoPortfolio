//
//  ViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 18/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

var width: CGFloat = 0.0

var data = getData()

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var albumName = ""
    
    var albumNumber = 0
    
    
    //synthax -  authorLabel.text = data[number]["author"]
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        navigationItem.backBarButtonItem = backItem
        
    }
    
  
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        
        
        cell.imgCell.image =  UIImage(named: data[indexPath.row][indexPath.row]["image"]!)
        
       cell.lblCell.text = data[indexPath.row][indexPath.row]["album"]
        
       
       
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            width = view.frame.width/2
           
            return CGSize(width: width, height: width)
            
            
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        
        albumName = data[indexPath.row][indexPath.row]["album"]!
        
        albumNumber = indexPath.row
        
                
        performSegueWithIdentifier("AlbumDetail", sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "AlbumDetail" {
            var detailViewController = segue.destinationViewController as! AlbumDetailViewController
        
            detailViewController.albumName = albumName
            detailViewController.albumNumber = albumNumber
        }
        
    }
    
    
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
}

