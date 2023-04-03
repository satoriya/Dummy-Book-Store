//
//  GenreResponse.swift
//  Bookist
//
//  Created by Alief Ahmad Azies on 31/03/23.
//

import Foundation

struct GenreResponse: Codable {
    let pageTitle: String
    let showingCount: Int
    let data: DataClass
}

// MARK: - Data
struct DataClass: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title, subtitle: String
    let image: String
    let url: String
    let rating, price: Double
    let genre: [String]
}
