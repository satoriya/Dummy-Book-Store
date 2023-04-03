//
//  GetNetworkImageService.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import UIKit

protocol GetNetworkImageProtocol {
    func get(
        from urlString: String,
        onCompletion: @escaping (_ fetchedImage: UIImage?, _ errorMessage: String?) -> Void
    )
}

var cache = NSCache<NSURL, UIImage>()

class GetNetworkImageService: GetNetworkImageProtocol {
    private let fetchDataService: FetchDataProtocol
    private var task: URLSessionTask?
    
    init(fetchDataService: FetchDataProtocol = FetchDataService()) {
        self.fetchDataService = fetchDataService
    }
    
    func get(
        from urlString: String,
        onCompletion: @escaping (
            _ fetchedImage: UIImage?,
            _ errorMessage: String?
        ) -> Void
    ) {
        
        guard let url = URL(string: urlString)
        else { return onCompletion(nil, "Invalid URL") }
        
        if let cachedImage = cache.object(forKey: url as NSURL) {
            return onCompletion(cachedImage, nil)
        }
        
        task = fetchDataService.fetch(url: url) { response in
            switch response {
            case .success(let fetchedData):
                if let fetchedImage = UIImage(data: fetchedData) {
                    return onCompletion(fetchedImage, nil)
                } else {
                    return onCompletion(nil, "Fetched Image is not working.")
                }
                
            case .failure(let fetchedError):
                return onCompletion(nil, fetchedError.getErrorMessage())
            }
        }
        task?.resume()
    }
    
    func cancelImageRequest() {
        task?.cancel()
    }
}
