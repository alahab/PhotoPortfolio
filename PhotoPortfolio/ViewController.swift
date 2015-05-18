//
//  ViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 18/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    var tableImages = ["ice_in_nowray.jpg", "RWANDA_terraced_field_agriculture.jpg", "NEW_ZEALAND_Tui_Bird_Kowhai_Tree.jpg", "ice_in_nowray.jpg", "RWANDA_terraced_field_agriculture.jpg", "NEW_ZEALAND_Tui_Bird_Kowhai_Tree.jpg", "ice_in_nowray.jpg", "RWANDA_terraced_field_agriculture.jpg", "NEW_ZEALAND_Tui_Bird_Kowhai_Tree.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableImages.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.lblCell.text = tableImages[indexPath.row]
        cell.imgCell.image =  UIImage(named: tableImages[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("image \(indexPath.row) is selected")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
          var width = view.frame.width/2.35
            
          return CGSize(width: width, height: width)
    }

}

