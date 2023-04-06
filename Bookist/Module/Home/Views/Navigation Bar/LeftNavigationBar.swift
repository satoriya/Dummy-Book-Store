//
//  LeftNavigationBar.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 31/03/23.
//

import UIKit

class LeftNavigationBar: UIBarButtonItem {
    private lazy var iconImage: UIImageView = {
        let img = UIImage(systemName: "text.book.closed.fill")
        
        let iconImageView = UIImageView(image: img)
        iconImageView.tintColor = UIColor(named: "styleColor")
        
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 22),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor)
        ])
        return iconImageView
    }()
    
    private lazy var appName: UILabel = {
        let lbl = UILabel()
        lbl.text = "Book Store"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return lbl
    }()
    
    private lazy var barStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    func setupBarItem() {
        barStackView.addArrangedSubview(iconImage)
        barStackView.addArrangedSubview(appName)
                
        self.customView = barStackView
    }
    
    
}
