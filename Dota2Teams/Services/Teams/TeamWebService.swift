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
    let logger: LoggingService
    
    init(manager: Alamofire.SessionManager,
         logger: LoggingService) {
        self.manager = manager
        self.logger = logger
    }
    
    func loadTeams(completion: @escaping ([Team]?, Error?) -> Void) {
        manager.request(URL.teams).responseDecodableObject() { [weak self] (response: DataResponse<[Team]>) in
            self?.logger.log(event: response)
            completion(response.result.value, response.error)
        }
    }
}
