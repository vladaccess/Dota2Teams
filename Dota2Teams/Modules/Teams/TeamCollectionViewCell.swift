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
    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadow()
    }
    
    var team: Team? {
        didSet {
            guard let team = team else { return }
            teamName.text = team.name
            teamRating.text = String(team.rating)
        }
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
