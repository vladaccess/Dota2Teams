//
//  ViewControllerFactory.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class ViewControllerFactory<T: UIViewController> {
    
    func create() -> T {
        return T()
    }
}
