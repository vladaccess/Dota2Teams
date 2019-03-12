//
//  PlayersViewController.swift
//  Dota2Teams
//
//  Created by Liquid on 12/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var teamID = 0
    var service: PlayerService?
    var players = [Player]()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollection()
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
            self?.collectionView.reloadData()
        })
    }
    
    func prepareCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: PlayerCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: PlayerCollectionViewCell.reuseIdentifier)
    }
}

extension PlayersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.reuseIdentifier, for: indexPath) as! PlayerCollectionViewCell
        cell.player = players[indexPath.row]
        return cell
    }
}

extension PlayersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
