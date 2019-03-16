//
//  Coordinator.swift
//  Dota2Teams
//
//  Created by Liquid on 16/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    let teamCoordinator: Coordinator
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = MainNavigationControllerFactory().create()
        teamCoordinator = TeamCoordinatorFactory(navigationController: rootViewController).create()
    }
    
    func start() {
        window.rootViewController = self.rootViewController
        teamCoordinator.start()
        window.makeKeyAndVisible()
    }
}
