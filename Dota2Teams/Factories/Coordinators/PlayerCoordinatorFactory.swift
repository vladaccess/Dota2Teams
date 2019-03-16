//
//  PlayerCoordinatorFactory.swift
//  Dota2Teams
//
//  Created by Liquid on 17/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class PlayerCoordinatorFactory: CoordinatorFactory {
    
    let navigationController: UINavigationController
    let team: Team
    
    init(navigationController: UINavigationController,
         team: Team) {
        self.navigationController = navigationController
        self.team = team
    }
    
    func create() -> Coordinator {
        return PlayerCoordinator(navigationController: navigationController,
                                 team: team)
    }
}
