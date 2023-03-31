//
//  Book.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 30/03/23.
//

import Foundation

struct Book: Codable {
    let pageTitle: String
    let showingCount: Int
    let data: DataClass
}

struct DataClass: Codable {
    let items: [Item]
}

struct Item: Codable {
    let cover: String
    let data: [BookData]
}

struct BookData: Codable {
    let title: String
    let image: String
    let subtitle: String?
    let url: String?
    let rating: Double?
    let price: String?
    let isbn13: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.image = try container.decode(String.self, forKey: .image)
        self.subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        do {
            self.price = try String(container.decodeIfPresent(Double.self, forKey: .price) ?? 0)
        } catch DecodingError.typeMismatch {
            self.price = try container.decodeIfPresent(String.self, forKey: .price)
        }
        
        self.isbn13 = try container.decodeIfPresent(String.self, forKey: .isbn13)
    }
}




enum Price: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Price.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Price"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}
