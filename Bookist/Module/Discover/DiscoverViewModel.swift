//
//  DiscoverViewModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import Foundation

protocol DiscoverViewModelDelegate {
    func handleGetDiscoverDataCompleted()
}

class DiscoverViewModel {
    private let getAPIService: GetAPIProtocol
    private let baseUrlString = "http://localhost:3002/discover"
    
    var discoverData: DiscoverModel?
    var errorMessage: String?
    var delegate: DiscoverViewModelDelegate?
    
    init(getAPIService: GetAPIProtocol = GetAPIService()) {
        self.getAPIService = getAPIService
    }
    
    func getDiscoverData() {
        errorMessage = nil
        getAPIService.get(from: baseUrlString, with: DiscoverModel.self) { resultData, errorMessage in
            if let resultData = resultData {
                self.discoverData = resultData
                self.delegate?.handleGetDiscoverDataCompleted()
            } else if let errorMessage = errorMessage {
                self.errorMessage = errorMessage
                self.delegate?.handleGetDiscoverDataCompleted()
            }
        }
    }
}
