//
//  DescriptionTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 30/03/23.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    static let identifier = "DescriptionTableViewCell"
    
    
    private lazy var descLabel : UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.numberOfLines = 0
        desc.font = .systemFont(ofSize: 18, weight: .bold)
        desc.textColor = .black
        desc.text = "About This Ebook"
        return desc
    }()
    
    private lazy var bookDesc : UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
        description.font = .systemFont(ofSize: 14, weight: .light)
        description.textColor = .black
        return description
    }()
    
    private lazy var arrowImg : UIButton = {
        let img = UIButton()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.setImage(UIImage(systemName: "arrow.right",withConfiguration:UIImage.SymbolConfiguration(pointSize: 15)), for: .normal)
        img.tintColor = .orange
        return img
    }()
    
    
    func setUpTableCell(bookData: BuyPageModel){
        bookDesc.text = bookData.about
        
        self.contentView.addSubview(descLabel)
        self.contentView.addSubview(bookDesc)
        self.contentView.addSubview(arrowImg)
        
        
        
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            descLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 3),
//            descLabel.trailingAnchor.constraint(equalTo: , constant: -3),
         
            arrowImg.topAnchor.constraint(equalTo: descLabel.topAnchor),
            arrowImg.leadingAnchor.constraint(equalTo: descLabel.trailingAnchor, constant: 10),
            arrowImg.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            bookDesc.topAnchor.constraint(equalTo: descLabel.topAnchor, constant: 35),
            bookDesc.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 3),
            bookDesc.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -3),
            bookDesc.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -3)
        ])
    }
  

}
