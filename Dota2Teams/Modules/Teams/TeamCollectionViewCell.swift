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
    private let playedMatchesFormatter = PlayedMatchesFormatter()
    
    @IBOutlet private weak var teamName: UILabel!
    @IBOutlet private weak var wins: UILabel!
    @IBOutlet private weak var losses: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadow()
    }
    
    var team: Team? {
        didSet {
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

private extension TeamCollectionViewCell {
    func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.1
        self.clipsToBounds = false
    }
}
