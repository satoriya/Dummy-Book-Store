//
//  DiscoverLeftBarItem.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import UIKit

class DiscoverLeftBarItem: UIBarButtonItem {
    private lazy var barIconImageView: UIImageView = {
        let image = UIImage(systemName: "text.book.closed.fill")
        
        let barIconImageView = UIImageView(image: image)
        barIconImageView.tintColor = .orange
        
        NSLayoutConstraint.activate([
            barIconImageView.widthAnchor.constraint(equalToConstant: 22),
            barIconImageView.heightAnchor.constraint(equalTo: barIconImageView.widthAnchor)
        ])
        
        return barIconImageView
    }()
    
    private lazy var barTitleLabel: UILabel = {
        let barTitleLabel = UILabel()
        barTitleLabel.text = "Discover"
        barTitleLabel.font = .boldSystemFont(ofSize: 20)
        
        return barTitleLabel
    }()
    
    private lazy var barStackView: UIStackView = {
        let barStackView = UIStackView()
        barStackView.axis = .horizontal
        barStackView.distribution = .fill
        barStackView.alignment = .fill
        barStackView.spacing = 16
        
        return barStackView
    }()
    
    func setupBarItem() {
        addSubviews()
    }
    
    private func addSubviews() {
        barStackView.addArrangedSubview(barIconImageView)
        barStackView.addArrangedSubview(barTitleLabel)
        
        self.customView = barStackView
    }
}
