//
//  LoadingViewControllerFactory.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class LoadingViewControllerFactory: ViewControllerFactory<LoadingViewController> {
    
    override func create() -> LoadingViewController {
        let viewController = super.create()
        viewController.view.backgroundColor = .white
        return viewController
    }
    
}
