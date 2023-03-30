//
//  DiscoverViewModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import Foundation

struct DiscoverViewModel {
    let discoverBooksSections: [DiscoverSectionBooksModel]
    let dummyBooks: [DiscoverBookModel] = [
        DiscoverBookModel(bookImageUrl: "star.fill", bookTitle: "Jono Kasino Indro Bolo bolo Bolo", bookRate: 4.5, bookPrice: 59),
        DiscoverBookModel(bookImageUrl: "person.fill", bookTitle: "Person.fill", bookRate: 3.5, bookPrice: 79),
        DiscoverBookModel(bookImageUrl: "person.circle.fill", bookTitle: "Ini Buku Bagus Boss, Tolong Dibeli", bookRate: 1.5, bookPrice: 100)
    ]
    
    init() {
        self.discoverBooksSections = [
            DiscoverSectionBooksModel(sectionType: .topCharts, sectionTitle: "Top Charts", sectionBooks: dummyBooks),
            DiscoverSectionBooksModel(sectionType: .topSelling, sectionTitle: "Top Selling", sectionBooks: dummyBooks),
            DiscoverSectionBooksModel(sectionType: .topFree, sectionTitle: "Top Free", sectionBooks: dummyBooks),
            DiscoverSectionBooksModel(sectionType: .topNewRelease, sectionTitle: "Top New Release", sectionBooks: dummyBooks)
        ]
    }
}
