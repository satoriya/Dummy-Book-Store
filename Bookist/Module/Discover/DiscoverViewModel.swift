//
//  DiscoverViewModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import Foundation

struct DiscoverViewModel {
    let discoverHeaders: [DiscoverHeaderSectionModel]
    
    init() {
        self.discoverHeaders = [
            DiscoverHeaderSectionModel(sectionType: .topCharts, sectionTitle: "Top Charts"),
            DiscoverHeaderSectionModel(sectionType: .topSelling, sectionTitle: "Top Selling"),
            DiscoverHeaderSectionModel(sectionType: .topFree, sectionTitle: "Top Free"),
            DiscoverHeaderSectionModel(sectionType: .topNewRelease, sectionTitle: "Top New Release")
        ]
    }
}
