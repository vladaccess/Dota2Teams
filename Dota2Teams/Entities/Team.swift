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
}

extension Team: CustomStringConvertible {
    
    var description: String { return "name:\(name), id:\(id)" }
    
}
