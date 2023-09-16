//
//  ColorCell.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 16.09.2023.
//

import UIKit

protocol ColorCellDelegate {}

class ColorCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isHighlighted: Bool {
        didSet {
            contentView.alpha = isHighlighted ? 0.7 : 1.0
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 10
    }
}

