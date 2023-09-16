//
//  Color.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 16.09.2023.
//

import UIKit

struct Color {
    let id = UUID()
    let color = UIColor.random()
}

extension Color: Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Color, rhs: Color) -> Bool {
        return lhs.id == rhs.id
    }
}
