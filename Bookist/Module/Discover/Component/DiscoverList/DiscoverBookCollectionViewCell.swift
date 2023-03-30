//
//  DiscoverBookCollectionViewCell.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 29/03/23.
//

import UIKit

class DiscoverBookCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DiscoverBookCollectionViewCell"

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.clipsToBounds = true
            containerView.layer.cornerRadius = 10
            containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    
    @IBOutlet weak var bookImageView: UIImageView! {
        didSet {
            bookImageView.contentMode = .scaleAspectFit
            bookImageView.layer.cornerRadius = 10
            bookImageView.backgroundColor = .black.withAlphaComponent(0.1)
        }
    }
    
    @IBOutlet weak var bookTitleLabel: UILabel! {
        didSet {
            bookTitleLabel.numberOfLines = 2
            bookTitleLabel.font = .boldSystemFont(ofSize: 18)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            
            bookTitleLabel.attributedText = NSAttributedString(string: "Jono Kasino Indro Bla bla bla", attributes: [.paragraphStyle: paragraphStyle])
        }
    }
    
    @IBOutlet weak var bookRatingImageView: UIImageView! {
        didSet {
            bookRatingImageView.tintColor = .darkGray
            bookRatingImageView.backgroundColor = .lightGray
            bookRatingImageView.image = UIImage(systemName: "star.leadinghalf.filled")
        }
    }
    
    @IBOutlet weak var bookRatingLabel: UILabel! {
        didSet {
            bookRatingLabel.textColor = .gray
            bookRatingLabel.font = .systemFont(ofSize: 13)
        }
    }
    
    @IBOutlet weak var bookPriceLabel: UILabel! {
        didSet {
            bookPriceLabel.textColor = .gray
            bookPriceLabel.font = .systemFont(ofSize: 13)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(book: DiscoverBookModel) {
        bookImageView.image = UIImage(systemName: book.bookImageUrl)
        bookTitleLabel.text = book.bookTitle
        bookRatingLabel.text = String(format: "%.2f", book.bookRate)
        bookPriceLabel.text = book.bookPriceString
    }

}
