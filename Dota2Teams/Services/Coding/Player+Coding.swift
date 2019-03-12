//
//  Player+Coding.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

extension Player: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "account_id"
        case name
        case gamesPlayed = "games_played"
        case wins
        case isTeamMember = "is_current_team_member"
    }
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        id = try map.decode(Int.self, forKey: .id)
        name = try map.decode(String?.self, forKey: .name)
        gamesPlayed = try map.decode(Int.self, forKey: .gamesPlayed)
        wins = try map.decode(Int.self, forKey: .wins)
        isTeamMember = try map.decode(Bool?.self, forKey: .isTeamMember)
    }
}

