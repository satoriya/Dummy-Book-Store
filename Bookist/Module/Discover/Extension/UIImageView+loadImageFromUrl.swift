//
//  UIImageView+loadImageFromUrl.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import UIKit

extension UIImageView {
    func loadImageFromUrl(
        _ urlString: String,
        withDefault defaultImage: UIImage?,
        targetSize: CGSize? = nil
    ) {
        let getImageNetworkService = GetNetworkImageService()
        
        getImageNetworkService.get(from: urlString) { imageData, errorMessage in
            var image: UIImage?
            
            if let imageData = imageData {
                image = UIImage(data: imageData)
                if let targetSize = targetSize {
                    image = image?.scaleImagePreservingRatio(with: targetSize)
                }
            } else if let errorMessage = errorMessage {
                print(errorMessage)
                image = defaultImage
            }
            
            DispatchQueue.main.async {
                self.image = image
                self.contentMode = .center
            }
        }
    }
}
