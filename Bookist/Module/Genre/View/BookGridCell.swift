//
//  BookCell.swift
//  Bookist
//
//  Created by Alief Ahmad Azies on 30/03/23.
//

import UIKit

class BookGridCell: UICollectionViewCell {
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookCoverImage: UIImageView!
    @IBOutlet weak var bookPriceLabel: UILabel!
    @IBOutlet weak var bookRatingLabel: UILabel!
    @IBOutlet weak var bottomStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupGridCell(item: GenreItem) {
        setupUI()
        setupData(item: item)
    }
    
    func setupUI() {
        bookCoverImage.layer.cornerRadius = 10
        bookCoverImage.layer.masksToBounds = true
        bookCoverImage.clipsToBounds = true
        
        bookTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        bookRatingLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        bookPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
    func setupData(item: GenreItem) {
        bookCoverImage.sd_setImage(with: URL(string: item.image))
        bookCoverImage.contentMode = .scaleToFill
        bookTitleLabel.text = item.title
        bookTitleLabel.numberOfLines = 3
        bookRatingLabel.text = "★\(item.rating)"
        bookPriceLabel.text = "$\(item.price)"
        bottomStack.spacing = 8
    }
}
