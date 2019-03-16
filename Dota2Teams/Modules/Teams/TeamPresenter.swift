//
//  TeamPresenter.swift
//  Dota2Teams
//
//  Created by Liquid on 15/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

protocol ITeamPresenter {
    func didTapTeam(team: Team) -> UIViewController
}

class TeamPresenter: ITeamPresenter {
    func didTapTeam(team: Team) -> UIViewController {
        let vc = PlayersViewControllerFactory().create()
        vc.teamID = team.id
        vc.title = team.tag
        return vc
    }
}
