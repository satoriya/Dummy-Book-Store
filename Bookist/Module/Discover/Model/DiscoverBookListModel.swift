//
//  DiscoverBookListModel.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import Foundation

struct DiscoverBookListModel: Decodable {
    let category: String
    let data: [DiscoverBookModel]
    
    enum CodingKeys: String, CodingKey {
        case category = "cover"
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decode(String.self, forKey: .category)
        self.data = try container.decode([DiscoverBookModel].self, forKey: .data)
    }
}
