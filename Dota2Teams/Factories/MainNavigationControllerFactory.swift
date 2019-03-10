//
//  MainNavigationControllerFactory.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class MainNavigationControllerFactory: StoryboardViewControllerFactory<MainNavigationController> {
    
    init() {
        super.init(storyboardName: "Main")
    }
    
    override func create() -> MainNavigationController {
        let mainController = super.create()
        return mainController
    }
}
