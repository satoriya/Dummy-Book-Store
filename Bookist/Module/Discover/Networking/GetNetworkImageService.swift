//
//  GetNetworkImageService.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import Foundation

protocol GetNetworkImageProtocol {
    func get(
        from urlString: String,
        onCompletion: @escaping (_ imageData: Data?, _ errorMessage: String?) -> Void
    )
}

struct GetNetworkImageService: GetNetworkImageProtocol {
    private let fetchDataService: FetchDataProtocol
    
    init(fetchDataService: FetchDataProtocol = FetchDataService()) {
        self.fetchDataService = fetchDataService
    }
    
    func get(
        from urlString: String,
        onCompletion: @escaping (_ imageData: Data?, _ errorMessage: String?) -> Void
    ) {
        fetchDataService.fetch(urlString: urlString) { response in
            switch response {
            case .success(let fetchData):
                return onCompletion(fetchData, nil)
                
            case .failure(let fetchError):
                return onCompletion(nil, fetchError.getErrorMessage())
            }
        }
    }
}
