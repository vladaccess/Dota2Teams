//
//  PlayerTableViewCell.swift
//  Dota2Teams
//
//  Created by Liquid on 16/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerName: UILabel!
    
    static let reuseIdentifier = String(describing: PlayerTableViewCell.self)
    
    var player: Player? {
        didSet {
            guard let player = player else { return }
            playerName.text = player.name
        }
    }
    
}
