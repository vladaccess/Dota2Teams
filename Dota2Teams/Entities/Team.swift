//
//  Team.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

struct Team {
    var id: Int
    var name: String
    var rating: Double
    var wins: Double
    var losses: Double
    var tag: String
}

extension Team {
    var allMatches: Double {
        return wins + losses
    }
}
