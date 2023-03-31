//
//  UIImageView.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 31/03/23.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: String, targetSize: CGSize) {
        contentMode = .center
        guard let unwrappedUrl = URL(string: url) else { return }
            URLSession.shared.dataTask(with: unwrappedUrl) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image.scalePreservingAspectRatio(targetSize: targetSize)
                    
                }
            }.resume()
        }
}
