//
//  PurchasedModel.swift
//  Bookist
//
//  Created by Farhan on 30/03/23.
//

import Foundation

struct PurchasedModel: Codable {
    let pageTitle: String
    let data: DatasClass
    
}

struct DatasClass: Codable {
    let items: [PurchasedItem]
}

struct PurchasedItem: Codable {
    let title: String
    let image: String
    let url: String
    let rating: Double
    let subtitle, isbn13: String?
}
