//
//  UIImage+scaleImagePreservingRatio.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 31/03/23.
//

import UIKit

extension UIImage {
    func scaleImagePreservingRatio(with targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let targetRatio = targetSize.width / targetSize.height
        let imageRatio = self.size.width / self.size.height
        
        let scaleFactor = max(targetRatio, imageRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: self.size.width * scaleFactor,
            height: self.size.height * scaleFactor
        )
        
        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )
        
        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}
