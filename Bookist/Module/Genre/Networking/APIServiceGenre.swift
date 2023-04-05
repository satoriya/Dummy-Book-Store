//
//  APIService.swift
//  Bookist
//
//  Created by Alief Ahmad Azies on 31/03/23.
//

import Foundation

protocol ApiServiceGenreProtocol {
    mutating func get(url: URL)
    func callApi<T: Codable>(model: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

struct ApiServiceGenre: ApiServiceGenreProtocol {
    
    private var url = URL(string: "")
    
    mutating func get(url: URL) {
        self.url = url
    }
    
    func callApi<T>(model: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        guard let url = self.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let photosData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(photosData))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
