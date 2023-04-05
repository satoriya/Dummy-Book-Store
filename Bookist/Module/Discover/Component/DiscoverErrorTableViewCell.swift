//
//  DiscoverErrorTableViewCell.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 03/04/23.
//

import UIKit

class DiscoverErrorTableViewCell: UITableViewCell {
    
    static let identifier = "DiscoverErrorTableViewCell"
    
    var delegate: DiscoverErrorViewDelegate?
    
    private lazy var errorView: DiscoverErrorView = {
        let discoverErrorView = DiscoverErrorView()
        discoverErrorView.translatesAutoresizingMaskIntoConstraints = false
        discoverErrorView.delegate = self
        
        return discoverErrorView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell() {
        addSubviews()
        setComponentsConstraints()
    }
    
    func setErrorMessage(_ error: String) {
        errorView.setErrorMessage(error)
    }
    
    private func addSubviews() {
        self.contentView.addSubview(errorView)
    }
    
    private func setComponentsConstraints() {
        NSLayoutConstraint.activate([
            errorView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            errorView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            errorView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            errorView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor)
        ])
    }
}

extension DiscoverErrorTableViewCell: DiscoverErrorViewDelegate {
    func handleOnReloadButtonSelected() {
        delegate?.handleOnReloadButtonSelected()
    }
}
