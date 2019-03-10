//
//  TeamsViewController.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var service: TeamService?
    var teams = [Team]()
    lazy var loadingViewController = LoadingViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollection()
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
            self.collectionView.reloadData()
        })
    }
    
    func prepareCollection() {
        collectionView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: TeamCollectionViewCell.id, bundle: nil),
                           forCellWithReuseIdentifier: TeamCollectionViewCell.id)
        collectionView.collectionViewLayout = TeamLayout()
    }
}

extension TeamsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCollectionViewCell.id, for: indexPath) as! TeamCollectionViewCell
        teamCell.team = teams[indexPath.row]
        return teamCell
    }
}
