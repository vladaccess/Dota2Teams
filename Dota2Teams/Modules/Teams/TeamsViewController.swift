//
//  TeamsViewController.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var service: TeamService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        service?.loadTeams(completion: { teams, error in
//
//        })
    }
    
}
