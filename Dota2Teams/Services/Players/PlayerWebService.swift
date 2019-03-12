//
//  PlayerWebService.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire



class PlayerWebService: PlayerService {
    
    let manager: Alamofire.SessionManager
    let logger: LoggingService
    
    init(manager: Alamofire.SessionManager,
         logger: LoggingService) {
        self.manager = manager
        self.logger = logger
    }
    
    func loadPlayers(from teamId: Int,
                     completion: @escaping ([Player]?,Error?) -> Void) {
        manager.request(URL.teams / "/\(teamId)/players").responseDecodableObject() { [weak self] (response: DataResponse<[Player]>) in
            self?.logger.log(event: response)
            completion(response.result.value, response.error)
        }
    }
}
