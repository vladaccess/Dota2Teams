//
//  File.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class StoryboardViewControllerFactory<T> {
    
    let storyboardName: String
    
    init(storyboardName: String) {
        self.storyboardName = storyboardName
    }
    
    func create() -> T {
        return UIStoryboard(name: storyboardName,
                            bundle: nil).instantiateInitialViewController() as! T
    }
    
}
