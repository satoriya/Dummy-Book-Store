//
//  Networking.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 30/03/23.
//

import Foundation

protocol APIServiceProtocol {
    
    func callApi<T: Codable>(with url: String, model: T.Type, completion: @escaping (Result<T, Error>) -> ())
}


struct APIService: APIServiceProtocol {
    
    
    func callApi<T>(with url: String, model: T.Type, completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable {
        guard let unwrappedUrl = URL(string: url) else { return }
        URLSession.shared.dataTask(with: unwrappedUrl) { data, reponse, error in
            if let data = data {
                do {
                    let modelData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(modelData))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
        
    }

    
}
