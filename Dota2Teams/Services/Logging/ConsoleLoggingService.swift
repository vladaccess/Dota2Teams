//
//  f.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

class ConsoleLoggingService: LoggingService {
    
    private func getId() -> String {
        struct Static {
            static var id: UInt = 0
        }
        Static.id += 1
        return "\(Static.id)"
    }
    
    func log(event: CustomStringConvertible) {
        print("🔸", getId(), event, "🔸")
    }
    
    func log(error: CustomStringConvertible, with properties: [String: String]) {
        let id = getId()
        print("🆘\(id)", error, "🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘🆘")
        properties.keys.sorted().forEach {
            print($0, "▶︎", properties[$0]!)
        }
        print("🆘\(id)\n")
    }
    
}
