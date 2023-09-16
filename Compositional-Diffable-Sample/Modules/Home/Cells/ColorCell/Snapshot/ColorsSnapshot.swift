//
//  ColorsSnapshot+Extension.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 16.09.2023.
//

import UIKit

typealias ColorsSnapshot = NSDiffableDataSourceSnapshot<Int, Color>

extension ColorsSnapshot {
    mutating func addRandomItems(count: Int = 10, to section: Int? = nil) {
        var items = [Color]()
        for _ in 0..<count {
            items.append(Color.init())
        }
        if let section = section {
            self.appendItems(items, toSection: section)
        } else {
            self.appendItems(items)
        }
    }
    
    static func random() -> ColorsSnapshot {
        var snapshot = ColorsSnapshot()
        snapshot.appendSections([0])
        snapshot.addRandomItems()
        return snapshot
    }
    
    mutating func addRandomItem(to section: Int? = nil) {
        let newItem = Color() 
        if let section = section {
            self.appendItems([newItem], toSection: section)
        } else {
            self.appendItems([newItem])
        }
    }
}
