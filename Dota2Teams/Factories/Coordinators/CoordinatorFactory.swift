//
//  CoordinatorFactory.swift
//  Dota2Teams
//
//  Created by Liquid on 17/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

protocol CoordinatorFactory {
    func create() -> Coordinator
}
