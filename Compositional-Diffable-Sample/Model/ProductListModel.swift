//
//  ProductListModel.swift
//  Compositional-Diffable-Sample
//
//  Created by osman.yesil on 15.09.2023.
//

import Foundation

// MARK: - Products
struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

typealias Products = [Product]
