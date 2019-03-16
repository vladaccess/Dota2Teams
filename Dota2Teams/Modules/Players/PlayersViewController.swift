//
//  PlayersViewController.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var teamID = 0
    var service: PlayerService?
    var players = [Player]()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPlayers()
    }
}

extension PlayersViewController {
    func loadPlayers() {
        service?.loadPlayers(from: teamID, completion: { [weak self] players, error in
            guard let players = players else { return }
            self?.players = players
            self?.tableView.reloadData()
        })
    }
    
    func prepareTable() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: PlayerTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PlayerTableViewCell.reuseIdentifier)
    }
}

extension PlayersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.reuseIdentifier, for: indexPath) as! PlayerTableViewCell
        cell.player = players[indexPath.row]
        return cell
    }
}
