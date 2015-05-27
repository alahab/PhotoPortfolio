//
//  NavBarExtensionViewController.swift
//  PhotoPortfolio
//
//  Created by Mariya Pavlyuchenko on 27/05/15.
//  Copyright (c) 2015 Mariya Pavlyuchenko. All rights reserved.
//

import UIKit

extension UINavigationController {
    public override func supportedInterfaceOrientations() -> Int {
        return visibleViewController.supportedInterfaceOrientations()
    }
}