//
//  ColoredDiffableDataSource.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 16.09.2023.
//

import UIKit

class ColoredDiffableDataSource: UICollectionViewDiffableDataSource<Int, Color> {
    init(collectionView: UICollectionView) {
        super.init(collectionView: collectionView) { (collectionView, indexPath, color) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.reuseIdentifier, for: indexPath)
            cell.contentView.backgroundColor = color.color
            return cell
        }
    }
}
