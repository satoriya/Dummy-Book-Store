//
//  DiscoverHeaderTableViewCell.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 29/03/23.
//

import UIKit

protocol DiscoverHeaderDelegate {
    func handleHeaderIconSelected(type: DiscoverSection)
}

class DiscoverHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "DiscoverHeaderTableViewCell"
    
    var delegate: DiscoverHeaderDelegate?
    
    private lazy var headerTitleLabel: UILabel = {
       let headerTitleLabel = UILabel()
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return headerTitleLabel
    }()
    
    private lazy var headerIconButton: UIButton = {
        let headerIconButton = UIButton(type: .system)
        headerIconButton.translatesAutoresizingMaskIntoConstraints = false
        
        let headerIconImage = UIImage(systemName: "arrow.right")
        headerIconButton.setImage(headerIconImage, for: .normal)
        headerIconButton.tintColor = .orange
        
        headerIconButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        headerIconButton.addTarget(self, action: #selector(onHeaderIconButtonSelected), for: .touchUpInside)
        
        return headerIconButton
    }()
    
    private lazy var headerStackView: UIStackView = {
       let headerStackView = UIStackView()
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        headerStackView.axis = .horizontal
        headerStackView.distribution = .fill
        headerStackView.alignment = .fill
        headerStackView.spacing = 8
        
        return headerStackView
    }()
    
    func setupCell(title: String, type: DiscoverSection) {
        headerTitleLabel.text = title
        headerIconButton.tag = type.rawValue
        
        addSubviews()
        setComponentConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(headerStackView)
        headerStackView.addArrangedSubview(headerTitleLabel)
        headerStackView.addArrangedSubview(headerIconButton)
    }
    
    private func setComponentConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            headerStackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            headerStackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10),
            headerStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
        ])
    }
    
    @objc func onHeaderIconButtonSelected(_ sender: UIButton) {
        delegate?.handleHeaderIconSelected(
            type: DiscoverSection(sender.tag)
        )
    }
}
