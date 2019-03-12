//
//  URL.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import Foundation

func / (left: URL, right: String) -> URL {
    return left.appendingPathComponent(right)
}
