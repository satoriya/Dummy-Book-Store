//
//  GetAPIService.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import Foundation

protocol GetAPIProtocol {
    func get<T: Decodable>(
        from urlString: String,
        with model: T.Type,
        onCompletion: @escaping (_ resultData :T?, _ errorMessage: String?) -> Void
    )
}

struct GetAPIService: GetAPIProtocol {
    private let fetchDataService: FetchDataProtocol
    private let parseDataService: ParseDataProtocol
    
    init(
        fetchDataService: FetchDataProtocol = FetchDataService(),
        parseDataService: ParseDataProtocol = ParseDataService()
    ) {
        self.fetchDataService = fetchDataService
        self.parseDataService = parseDataService
    }
    
    func get<T>(
        from urlString: String,
        with model: T.Type,
        onCompletion: @escaping (_ resultData :T?, _ errorMessage: String?) -> Void)
    where T : Decodable {
        fetchDataService.fetch(urlString: urlString) { fetchResponse in
            switch fetchResponse {
            case .success(let fetchedData):
                parseDataService.parse(fetchedData, to: model) { parseResponse in
                    
                    switch parseResponse {
                    case .success(let parsedData):
                        return onCompletion(parsedData, nil)
                        
                    case .failure(let parseError):
                        return onCompletion(nil, parseError.localizedDescription)
                    }
                    
                }
                
            case .failure(let fetchedError):
                return onCompletion(nil, fetchedError.getErrorMessage())
            }
        }
    }
}
