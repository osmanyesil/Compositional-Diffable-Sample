//
//  UICollectionReusableView+Extension.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 16.09.2023.
//

import UIKit

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
