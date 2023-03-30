//
//  FetchDataService.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import Foundation

enum FetchDataError: Error {
    case invalidUrl
    case fetchError(_ error: String)
    case noData
    
    func getErrorMessage() -> String {
        switch self {
        case .invalidUrl:
            return "Invalid URL, please check the URL and try again."
        case .noData:
            return "No Data is returned from the API"
        case .fetchError(let error):
            return error
        }
    }
}

protocol FetchDataProtocol {
    func fetch(
        urlString: String,
        onCompletion: @escaping (Result<Data, FetchDataError>) -> Void
    )
}

struct FetchDataService: FetchDataProtocol {
    func fetch(
        urlString: String,
        onCompletion: @escaping (Result<Data, FetchDataError>) -> Void
    ) {
        guard let url = URL(string: urlString)
        else { return onCompletion(.failure(.invalidUrl)) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                return onCompletion(.failure(
                    .fetchError(error.localizedDescription)
                ))
            } else if let response = response as? HTTPURLResponse,
                      response.statusCode > 299 {
                return onCompletion(.failure(
                    .fetchError(response.description)
                ))
            }
            
            if let data = data {
                return onCompletion(.success(data))
            }
            
            return onCompletion(.failure(.noData))
            
        }.resume()
    }
}
