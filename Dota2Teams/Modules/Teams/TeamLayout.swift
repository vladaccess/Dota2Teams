//
//  TeamLayout.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class TeamLayout: UICollectionViewFlowLayout {
    
    let cellInset: CGFloat = 20
    let cellHeight: CGFloat = 80
    
    override func prepare() {
        setupLayout()
    }
    
    func setupLayout() {
        minimumLineSpacing = cellInset
        sectionInset.top = cellInset
        sectionInset.bottom = cellInset
    }
    
    override var itemSize: CGSize {
        get {
            return CGSize(width: collectionView!.bounds.width - cellInset * 2, height: cellHeight)
        }
        set {
            self.itemSize = CGSize(width: collectionView!.bounds.width - cellInset * 2, height: cellHeight)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
