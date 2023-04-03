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

class GetAPIService: GetAPIProtocol {
    private let fetchDataService: FetchDataProtocol
    private let parseDataService: ParseDataProtocol
    private var task: URLSessionTask?
    
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
        
        guard let url = URL(string: urlString)
        else { return onCompletion(nil, "Invalid URL")}
        
        task = fetchDataService.fetch(url: url) { fetchResponse in
            switch fetchResponse {
            case .success(let fetchedData):
                self.parseDataService.parse(fetchedData, to: model) { parseResponse in
                    
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
        
        task?.resume()
    }
}
