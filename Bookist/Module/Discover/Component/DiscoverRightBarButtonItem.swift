//
//  DiscoverRightBarButtonItem.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 30/03/23.
//

import UIKit

protocol DiscoverRightBarButtonItemDelegate {
    func handleSearchButtonSelected()
}

class DiscoverRightBarButtonItem: UIBarButtonItem {
    
    var delegate: DiscoverRightBarButtonItemDelegate?
    
    private lazy var barButtonItem: UIButton = {
        let searchIconImage = UIImage(systemName: "magnifyingglass")
        
        let barButtonItem = UIButton(type: .system)
        barButtonItem.setImage(searchIconImage, for: .normal)
        barButtonItem.tintColor = .black
        
        barButtonItem.addTarget(self, action: #selector(onBarButtonItemSelected), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            barButtonItem.widthAnchor.constraint(equalToConstant: 30),
            barButtonItem.heightAnchor.constraint(equalTo: barButtonItem.widthAnchor)
        ])
        
        return barButtonItem
    }()
    
    func setupBarButtonItem() {
        self.customView = barButtonItem
    }
    
    @objc func onBarButtonItemSelected(_ sender: UIButton) {
        delegate?.handleSearchButtonSelected()
    }
}
