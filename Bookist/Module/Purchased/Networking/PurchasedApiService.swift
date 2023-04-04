//
//  ApiService.swift
//  Bookist
//
//  Created by Farhan on 30/03/23.
//

import Foundation

protocol ApiServiceProtocol {
    func get(url: URL)
    func callApi<T:Codable>(model:T.Type, completion: @escaping (Result<T,Error>) -> Void)
}

class PurchasedApiService: ApiServiceProtocol {
    private var url = URL(string: "")
    func get(url: URL) {
        self.url = url
    }
    
    func callApi<T>(model: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        guard let url = self.url else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                    print("success call api \(decodedData)")
                }
                catch {
                    completion(.failure(error))
                        print("error call api \(error)")
                }
            }
        }.resume()
    }
    
    
}
