//
//  BookListCell.swift
//  Bookist
//
//  Created by Alief Ahmad Azies on 30/03/23.
//

import UIKit
import SDWebImage

class BookListCell: UICollectionViewCell {
    
    var tagList: [String] = ["Fantasy", "Sci-Fi", "Kids"]
    
    let background: UIView = {
        let vw = UIView()
        return vw
    }()
    
    let bookCoverImage: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    let bookTitleLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    let bookRatingLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    let bookPriceLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    let tagStackView: UIStackView = {
        let sv = UIStackView()
        return sv
    }()
    
    func setupListCell(item: Item) {
        setupUI()
        setupData(item: item)
    }
    
    func setupUI() {
        contentView.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        background.addSubview(bookCoverImage)
        bookCoverImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookCoverImage.topAnchor.constraint(equalTo: background.topAnchor),
            bookCoverImage.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            bookCoverImage.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            bookCoverImage.widthAnchor.constraint(equalToConstant: 120)
        ])
        bookCoverImage.layer.cornerRadius = 10
        bookCoverImage.layer.masksToBounds = true
        
        background.addSubview(bookTitleLabel)
        bookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookTitleLabel.leadingAnchor.constraint(equalTo: bookCoverImage.trailingAnchor, constant: 8),
            bookTitleLabel.topAnchor.constraint(equalTo: background.topAnchor),
            bookTitleLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -16)
        ])
        bookTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        bookTitleLabel.numberOfLines = 3
        bookTitleLabel.textColor = .label
        bookTitleLabel.sizeToFit()
        bookTitleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        background.addSubview(bookRatingLabel)
        bookRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookRatingLabel.leadingAnchor.constraint(equalTo: bookTitleLabel.leadingAnchor),
            bookRatingLabel.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor, constant: 8)
        ])
        bookRatingLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        background.addSubview(bookPriceLabel)
        bookPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookPriceLabel.leadingAnchor.constraint(equalTo: bookTitleLabel.leadingAnchor),
            bookPriceLabel.topAnchor.constraint(equalTo: bookRatingLabel.bottomAnchor, constant: 8)
        ])
        bookPriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        background.addSubview(tagStackView)
        tagStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagStackView.topAnchor.constraint(equalTo: bookPriceLabel.bottomAnchor, constant: 16),
            tagStackView.leadingAnchor.constraint(equalTo: bookCoverImage.trailingAnchor, constant: 8),
            tagStackView.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -8),
        ])
        
        let constraint = tagStackView.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -16)
        constraint.priority = .defaultLow
        constraint.isActive = true
    }
    
    func setupData(item: Item) {
        bookCoverImage.sd_setImage(with: URL(string: item.image))
        
        bookTitleLabel.text = item.title
        
        bookPriceLabel.text = "$\(item.price)"
        
        bookRatingLabel.text = "⭑\(item.rating)"
        
        tagStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        tagStackView.axis = .horizontal
        tagStackView.distribution = .fillProportionally
        tagStackView.spacing = 4
        item.genre.forEach { tag in
            let bgTag = UIView()
            bgTag.translatesAutoresizingMaskIntoConstraints = false
            bgTag.backgroundColor = .lightGray
            bgTag.layer.cornerRadius = 4
            bgTag.layer.masksToBounds = true
            let tagLabel = UILabel()
            tagLabel.translatesAutoresizingMaskIntoConstraints = false
            bgTag.addSubview(tagLabel)
            tagLabel.text = tag
            tagLabel.font = UIFont.systemFont(ofSize: 12)
            tagLabel.textColor = .black
            tagLabel.textAlignment = .center
            NSLayoutConstraint.activate([
                tagLabel.leadingAnchor.constraint(equalTo: bgTag.leadingAnchor, constant: 2),
                tagLabel.topAnchor.constraint(equalTo: bgTag.topAnchor, constant: 2),
                tagLabel.trailingAnchor.constraint(equalTo: bgTag.trailingAnchor, constant: -2),
                tagLabel.bottomAnchor.constraint(equalTo: bgTag.bottomAnchor, constant: -2)
            ])
            self.tagStackView.addArrangedSubview(bgTag)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
