//
//  DiscoverBookModel.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import Foundation

//struct DiscoverBookModel {
//    let bookImageUrl: String
//    let bookTitle: String
//    let bookRate: Double
//    let bookPrice: Double
//
//    var bookPriceString: String {
//        return String(format: "$%.2f", locale: .current, bookPrice)
//    }
//}

struct DiscoverBookModel: Decodable {
    let title: String
    let subtitle: String
    let imageUrlString: String
    let isbn: String?
    let sourceUrlString: String
    let rating: Double?
    let price: String?
    
    var priceString: String {
        guard let price = price, let priceFirstChar = price.first
        else { return "$0.0" }

        if priceFirstChar.isNumber,
            let priceDouble = Double(price) {
            let priceString = String(format: "$%.2f", locale: .current, priceDouble)

            return priceString
        }
        
        return price
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle
        case imageUrlString = "image"
        case isbn = "isbn13"
        case sourceUrlString = "url"
        case rating
        case price
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        self.imageUrlString = try container.decode(String.self, forKey: .imageUrlString)
        self.isbn = try container.decodeIfPresent(String.self, forKey: .isbn)
        self.sourceUrlString = try container.decode(String.self, forKey: .sourceUrlString)
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        
        do {
            self.price = try String(container.decodeIfPresent(Double.self, forKey: .price) ?? 0)
        } catch DecodingError.typeMismatch {
            self.price = try container.decodeIfPresent(String.self, forKey: .price)
        }
    }
}
