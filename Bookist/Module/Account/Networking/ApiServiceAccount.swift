//
//  ApiService.swift
//  Bookist
//
//  Created by Phincon on 03/04/23.
//

import Foundation

protocol ApiServiceAccountProtocol {
    mutating func get(url: URL)
    func callApi<T: Decodable>(model: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

struct ApiServiceAccount: ApiServiceAccountProtocol {
    private var url = URL(string: "")
    mutating func get(url: URL) {
        self.url = url
    }
    
    func callApi<T>(model: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        guard let url = self.url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let successData = data {
                do {
                    let modelData = try JSONDecoder().decode(T.self, from: successData)
                    completion(.success(modelData))
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            }
        }.resume()
    }
}
