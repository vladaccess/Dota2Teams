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
    lazy var loadingViewController = LoadingViewController()
    var searchBar: UISearchBar = UISearchBar()
    var layout: UICollectionViewLayout = UICollectionViewLayout()
    
    var teams = [Team]()
    var filterTeams = [Team]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollection()
        setupSearchBar()
        loadItems()
    }
    
}

extension TeamsViewController {
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        navigationItem.titleView = searchBar
    }
    
    func filterForSearch(_ text: String) {
        filterTeams = teams.filter { $0.tag.lowercased().contains(text.lowercased()) }
    }
    
    func isSearchBarEmpty() -> Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return !isSearchBarEmpty()
    }
    
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
        collectionView.collectionViewLayout = layout
        collectionView.keyboardDismissMode = .onDrag
    }
}

extension TeamsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterForSearch(searchBar.text!)
        collectionView.reloadData()
    }
}

extension TeamsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFiltering() ? filterTeams.count : teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCollectionViewCell.id, for: indexPath) as! TeamCollectionViewCell
        teamCell.team = isFiltering() ? filterTeams[indexPath.row] : teams[indexPath.row]
        return teamCell
    }
}
