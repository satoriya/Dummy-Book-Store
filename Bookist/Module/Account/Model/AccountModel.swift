//
//  ApiService.swift
//  Bookist
//
//  Created by Phincon on 03/04/23.
//

import Foundation

struct Account: Decodable {
    let userName: String
    let userImage: String
    let email: String
    let data: Items
    
    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userImage = "user_image"
        case email
        case data
    }
}

struct Items: Decodable {
    var items: [ItemSection]
    
}

struct ItemSection: Decodable {
    var item: [AccountItem]
}

struct AccountItem: Decodable {
    let itemName: String
    var iconName: String
    var iconTint: String
    var bgIconColor: String
    var textColor: String
    
    enum CodingKeys: String, CodingKey {
        case itemName = "item_name"
        case iconName = "icon_name"
        case iconTint = "icon_tint"
        case bgIconColor = "icon_bg_color"
        case textColor = "text_color"
    }
}
