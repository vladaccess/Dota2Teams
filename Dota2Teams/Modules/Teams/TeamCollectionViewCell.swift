//
//  TeamCollectionViewCell.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {

    static let id = String(describing: TeamCollectionViewCell.self)
    let playedMatchesFormatter = PlayedMatchesFormatter()
    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var losses: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadow()
    }
    
    var team: Team? {
        didSet {
            guard let _ = team else { return }
            setData()
        }
    }
    
    func setData() {
        guard let team = team else { return }
        teamName.text = team.tag
        wins.text = playedMatchesFormatter.string(forMatches: team.wins,
                                                  allMatches: team.allMatches)
        losses.text = playedMatchesFormatter.string(forMatches: team.losses,
                                                  allMatches: team.allMatches)
    }
}

extension TeamCollectionViewCell {
    func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.1
        self.clipsToBounds = false
    }
}
