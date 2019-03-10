//
//  Coding.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

extension Team: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "team_id"
        case name
        case rating
        case wins
        case losses
        case tag
    }
    
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        tag = try map.decode(String.self, forKey: .tag)
        id = try map.decode(Int.self, forKey: .id)
        rating = try map.decode(Double.self, forKey: .rating)
        name = try map.decode(String.self, forKey: .name)
        wins = try map.decode(Double.self, forKey: .wins)
        losses = try map.decode(Double.self, forKey: .losses)
    }
    
}
