//
//  PlayersViewControllerFactory.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

class PlayersViewControllerFactory: StoryboardViewControllerFactory<PlayersViewController> {
    
    init() {
        super.init(storyboardName: "Players")
    }
    
    override func create() -> PlayersViewController {
        let viewController = super.create()
        viewController.service = PlayerWebService(manager: .default,
                                                  logger: ConsoleLoggingService())
        viewController.title = "Players"
        return viewController
    }
}
