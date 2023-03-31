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
    
    func setupUI() {
        bookCoverImage.layer.cornerRadius = 10
        bookCoverImage.layer.masksToBounds = true
        bookCoverImage.clipsToBounds = true
        
        bookTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        bookRatingLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        bookPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
    
    func setupData() {
        bookCoverImage.image = UIImage(systemName: "person")
        bookCoverImage.backgroundColor = .systemRed
        bookCoverImage.contentMode = .scaleAspectFill
        bookTitleLabel.text = "Harry Potter and the Deadly Hallows"
        bookTitleLabel.numberOfLines = 2
        bookRatingLabel.text = "⭐️ 4.9"
        bookPriceLabel.text = "$4.99"
        bottomStack.spacing = 8
    }

}
