//
//  PlayerCollectionViewCell.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: PlayerCollectionViewCell.self)
    
    @IBOutlet weak var playerAvatar: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    
    var player: Player? {
        didSet {
            guard let player = player else { return }
            playerName.text = player.name
        }
    }

}
