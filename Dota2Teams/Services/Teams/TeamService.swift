//
//  TeamService.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

protocol TeamService {
    func loadTeams(completion: @escaping ([Team]?, Error?) -> Void)
}
