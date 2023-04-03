//
//  ApiService.swift
//  Bookist
//
//  Created by Phincon on 30/03/23.
//

import Foundation

protocol ApiServiceWishlistProtocol {
    mutating func get(url: URL)
    
    func callApi<T:Codable>(model: T.Type, completion:@escaping (Result<T, Error>) -> Void)
}
struct GetWishlistApi: ApiServiceWishlistProtocol {
    
    private var url = URL(string: "")
   
    mutating func get(url: URL) {
            self.url = url
    }
    
    func callApi<T>(model: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        
        guard let url = self.url else { return }
        
        URLSession.shared.dataTask(with: url) { data,response, error in
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
