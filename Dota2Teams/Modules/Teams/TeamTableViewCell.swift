//
//  TeamTableViewCell.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    static let id = String(describing: TeamTableViewCell.self)
    
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var team: Team? {
        didSet {
            guard let team = team else { return }
            nameTeam.text = team.name
            rating.text = String(team.rating)
        }
    }
    
}
