//
//  TeamCoordinator.swift
//  Dota2Teams
//
//  Created by Liquid on 16/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class TeamCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private var teamViewController: UIViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = TeamsViewControllerFactory().create()
        viewController.delegate = self
        teamViewController = viewController
        navigationController.pushViewController(viewController, animated: false)
    }
    
}

extension TeamCoordinator: TeamsViewControllerDelegate {
    func teamsViewControllerDidSelect(team: Team) {
        let coordinator = PlayerCoordinatorFactory(navigationController: navigationController, team: team).create()
        coordinator.start()
    }
}
