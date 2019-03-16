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
    
    private var service: PlayerService?
    var players = [Player]()
    var team: Team?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPlayers()
    }
}

private extension PlayersViewController {
    func loadPlayers() {
        guard let team = team else { return }
        service?.loadPlayers(from: team.id, completion: { [weak self] players, error in
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
