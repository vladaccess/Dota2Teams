//
//  TeamWebService.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Alamofire
import Foundation
import CodableAlamofire

class TeamWebService: TeamService {
    
    let manager: Alamofire.SessionManager
    
    init(manager: Alamofire.SessionManager) {
        self.manager = manager
    }
    
    func loadTeams(completion: @escaping ([Team]?, Error?) -> Void) {
        manager.request(URL.teams).responseDecodableObject() { (response: DataResponse<[Team]>) in
            completion(response.result.value, response.error)
        }
    }
}
