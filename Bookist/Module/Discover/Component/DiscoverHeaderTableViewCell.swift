//
//  DiscoverHeaderTableViewCell.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 29/03/23.
//

import UIKit

protocol DiscoverHeaderDelegate {
    func handleHeaderIconSelected(type: String)
}

class DiscoverHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "DiscoverHeaderTableViewCell"
    
    var delegate: DiscoverHeaderDelegate?
    
    private let horizontalSpacing: CGFloat = 18
    private let verticalSpacing: CGFloat = 10
    
    private lazy var headerTitleLabel: UILabel = {
       let headerTitleLabel = UILabel()
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
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
    
    func setupCell(title: String, cellIndex: Int) {
        headerTitleLabel.text = title
        headerIconButton.tag = cellIndex
        
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
            headerStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: verticalSpacing),
            headerStackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: horizontalSpacing),
            headerStackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -horizontalSpacing),
            headerStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -verticalSpacing),
        ])
    }
    
    @objc func onHeaderIconButtonSelected(_ sender: UIButton) {
        delegate?.handleHeaderIconSelected(type: sender.titleLabel?.text ?? "No Title")
    }
}
