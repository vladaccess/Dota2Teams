//
//  PlayerCoordinator.swift
//  Dota2Teams
//
//  Created by Liquid on 16/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class PlayerCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let team: Team
    var playerViewController: UIViewController?
    
    init(navigationController: UINavigationController,
         team: Team) {
        self.navigationController = navigationController
        self.team = team
    }
    
    func start() {
        let viewController = PlayersViewControllerFactory().create()
        self.playerViewController = viewController
        viewController.team = team
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

