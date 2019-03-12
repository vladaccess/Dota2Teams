//
//  LoggingService.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

protocol LoggingService {
    
    func log(event: CustomStringConvertible)
    func log(error: CustomStringConvertible, with: [String: String])
    
}
