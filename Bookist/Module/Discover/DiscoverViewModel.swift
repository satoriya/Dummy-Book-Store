//
//  DiscoverViewModel.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import Foundation

protocol DiscoverViewModelDelegate {
    func refresh()
}

class DiscoverViewModel {
    private let getAPIService: GetAPIProtocol
    private let baseUrlString = "http://localhost:3002/discover"
    
    var discoverData: DiscoverModel?
    var errorMessage: String?
    var delegate: DiscoverViewModelDelegate?
    var isLoading = false
    
    init(getAPIService: GetAPIProtocol = GetAPIService()) {
        self.getAPIService = getAPIService
    }
    
    
    func getDiscoverData() {
        if isLoading { return }
        
        isLoading = true
        
        if errorMessage != nil {
            errorMessage = nil
            delegate?.refresh()
        } else {
            errorMessage = nil
        }
        
        getAPIService.get(from: baseUrlString, with: DiscoverModel.self) { resultData, errorMessage in
            self.isLoading = false
            
            if let resultData = resultData {
                self.discoverData = resultData
                self.delegate?.refresh()
            } else if let errorMessage = errorMessage {
                self.errorMessage = errorMessage
                self.delegate?.refresh()
            }
        }
    }
}
