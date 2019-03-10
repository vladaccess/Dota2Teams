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
    var teams = [Team]()
    lazy var loadingViewController = LoadingViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
        loadItems()
    }
    
}

extension TeamsViewController {
    
    func loadItems() {
        add(loadingViewController)
        service?.loadTeams(completion: { [weak self] teams, error in
            guard let self = self else { return }
            self.loadingViewController.remove()
            guard let teams = teams else { return }
            self.teams = teams
            self.tableView.reloadData()
        })
    }
    
    func prepareTable() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: TeamTableViewCell.id, bundle: nil),
                           forCellReuseIdentifier: TeamTableViewCell.id)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
}

extension TeamsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teamCell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.id, for: indexPath) as! TeamTableViewCell
        teamCell.team = teams[indexPath.row]
        return teamCell
    }
}
