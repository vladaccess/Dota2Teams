//
//  PlayerService.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

protocol PlayerService {
    func loadPlayers(from teamId: Int,
                     completion: @escaping ([Player]?,Error?) -> Void)
}
