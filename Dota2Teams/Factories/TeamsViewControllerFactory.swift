//
//  TeamsViewControllerFactory.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit
import Alamofire

class TeamsViewControllerFactory: StoryboardViewControllerFactory<TeamsViewController> {
    
    init() {
        super.init(storyboardName: "Teams")
    }
    
    override func create() -> TeamsViewController {
        let viewController = super.create()
        viewController.title = "Teams"
        viewController.service = TeamWebService(manager: .default,
                                                logger: ConsoleLoggingService())
        viewController.layout = TeamLayout()
        return viewController
    }
}
