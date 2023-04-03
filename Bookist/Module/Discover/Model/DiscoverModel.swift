//
//  DiscoverModel.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import Foundation

struct DiscoverModel: Decodable {
    let pageTitle: String
    let showingCount: Int
    let data: DiscoverItemsModel
}
