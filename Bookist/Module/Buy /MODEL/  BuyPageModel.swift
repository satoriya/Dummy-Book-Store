//
//  BuyViewModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import Foundation

struct BuyPageModel: Codable {
    let pageTitle, title, subtitle, about: String
    let author: String
    let price: Double
    let image: String
    let url: String
    let genre: [String]
    let releaseDate: Int
    let bookDescription: BookDescription
    let similarBooks: [SimilarBook]

    enum CodingKeys: String, CodingKey {
        case pageTitle, title, subtitle, about, author, price, image, url, genre
        case releaseDate = "release_date"
        case bookDescription = "book_description"
        case similarBooks = "similar_books"
    }
    
    
}

struct BookDescription: Codable {
    let rating: Double
    let reviews: Int
    let size: Double
    let pages, purchase: Int
}


struct SimilarBook: Codable {
    let showCount: Int
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case showCount = "show_count"
        case data
    }
}

struct Datum: Codable {
    let title, subtitle: String
    let image: String
    let url: String
    let rating: Double
    let price: Int
    let isbn13: String?
}
