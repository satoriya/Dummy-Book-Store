//
//  DiscoverBookModel.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import Foundation

struct DiscoverBookModel {
    let bookImageUrl: String
    let bookTitle: String
    let bookRate: Double
    let bookPrice: Double
    
    var bookPriceString: String {
        return String(format: "$%.2f", locale: .current, bookPrice)
    }
}
