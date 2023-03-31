//
//  RightNavigationBar.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 31/03/23.
//

import UIKit

class RightNavigationBar: UIBarButtonItem {
    private lazy var searchButton: UIButton = {
        let image = UIImage(systemName: "magnifyingglass")
        
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 30),
            button.heightAnchor.constraint(equalTo: button.widthAnchor)
        ])
        
        return button
    }()
    
    private lazy var notificationButton: UIButton = {
        let image = UIImage(systemName: "bell")
        
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.tintColor = .label
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 30),
            button.heightAnchor.constraint(equalTo: button.widthAnchor)
        ])
        
        return button
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
        barStackView.addArrangedSubview(searchButton)
        barStackView.addArrangedSubview(notificationButton)
                
        self.customView = barStackView
    }
    
}
