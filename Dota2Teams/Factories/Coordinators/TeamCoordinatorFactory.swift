//
//  TeamCoordinatorFactory.swift
//  Dota2Teams
//
//  Created by Liquid on 17/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class TeamCoordinatorFactory: CoordinatorFactory {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func create() -> Coordinator {
        return TeamCoordinator(navigationController: navigationController)
    }
}
