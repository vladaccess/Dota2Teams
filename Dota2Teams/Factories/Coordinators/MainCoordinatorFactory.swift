//
//  MainCoordinatorFactory.swift
//  Dota2Teams
//
//  Created by Liquid on 17/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class MainCoordinatorFactory: CoordinatorFactory {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func create() -> Coordinator {
        return MainCoordinator(window: window)
    }
}
