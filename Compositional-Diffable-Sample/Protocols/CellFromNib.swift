//
//  CellFromNib.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 16.09.2023.
//

import UIKit

protocol CellFromNib: UICollectionViewCell { }

extension CellFromNib {
    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }
}
