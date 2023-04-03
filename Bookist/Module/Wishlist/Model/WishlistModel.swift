//
//  WishlistModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.

import Foundation

struct WishlistModel : Codable {
    let pageTitle : String
    let showingCount: Int
    let data: DataClass
}
struct DataClass: Codable {
    let items: [Item]
}
struct Item: Codable {
    let title: String
    let image: String
    let url: String
    let rating: Double?
    let price: Double
    let subtitle, isbn13: String?
}
