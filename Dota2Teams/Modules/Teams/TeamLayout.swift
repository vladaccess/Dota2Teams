//
//  TeamLayout.swift
//  Dota2Teams
//
//  Created by Liquid on 10/03/2019.
//  Copyright © 2019 attom. All rights reserved.
//

import UIKit

class TeamLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        setupLayout()
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 20
        sectionInset.top = 20
    }
    
    override var itemSize: CGSize {
        get {
            return CGSize(width: collectionView!.bounds.width - 40, height: 80)
        }
        set {
            self.itemSize = CGSize(width: collectionView!.bounds.width - 40, height: 80)
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
