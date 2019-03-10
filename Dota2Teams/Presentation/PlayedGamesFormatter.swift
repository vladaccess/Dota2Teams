//
//  PlayedGamesFormatter.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

class PlayedMatchesFormatter {
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()
    
    func string(forMatches matches: Double, allMatches: Double) -> String {
        return formatter.string(for: matches/allMatches) ?? ""
    }
}
