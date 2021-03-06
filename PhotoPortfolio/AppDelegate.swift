//
//  AppDelegate.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 18/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
        
        // Override point for customization after application launch.
        
        //UINavigationBar.appearance().backgroundColor = UIColor(red: 43.0/255.0, green: 69.0/255.0, blue: 83.0/255.0, alpha: 1.0)
        
        //UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
        
       // UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red: 43.0/255.0, green: 69.0/255.0, blue: 83.0/255.0, alpha: 0.4)]
        
       // UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
       
        
        if let font = UIFont(name: "STHeitiTC-Medium", size: 20) {
           UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.whiteColor() ]
           UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: font, NSForegroundColorAttributeName: UIColor.whiteColor() ], forState: UIControlState.Normal)
        }
        
       UIApplication.sharedApplication().statusBarHidden = true
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    //WAS TRYING TO MAKE ONL ONE VIEWCOLNTROLLER ROTATE
//    func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow?) -> Int {
//        
//        if self.window?.rootViewController?.presentedViewController is ImageDetailCollectionCollectionViewController {
//            return Int(UIInterfaceOrientationMask.All.rawValue);
//        } else {
//            return Int(UIInterfaceOrientationMask.Portrait.rawValue);
//        }
//        
//    }
    
   
}

