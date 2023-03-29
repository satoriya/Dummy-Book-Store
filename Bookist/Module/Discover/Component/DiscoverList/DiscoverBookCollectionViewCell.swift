//
//  DiscoverBookCollectionViewCell.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 29/03/23.
//

import UIKit

class DiscoverBookCollectionViewCell: UICollectionViewCell {

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
        }
    }
    
    @IBOutlet weak var bookTitleLabel: UILabel! {
        didSet {
            bookTitleLabel.numberOfLines = 2
            bookTitleLabel.font = .boldSystemFont(ofSize: 18)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            
            bookTitleLabel.attributedText = NSAttributedString(string: "", attributes: [.paragraphStyle: paragraphStyle])
        }
    }
    
    @IBOutlet weak var bookRatingImageView: UIImageView! {
        didSet {
            bookRatingImageView.tintColor = .darkGray
            bookImageView.backgroundColor = .lightGray
            bookImageView.image = UIImage(systemName: "star.leadinghalf.filled")
        }
    }
    
    @IBOutlet weak var bookRatingLabel: UILabel! {
        didSet {
            bookRatingLabel.tintColor = .gray
            bookRatingLabel.font = .systemFont(ofSize: 13)
        }
    }
    
    @IBOutlet weak var bookPriceLabel: UILabel! {
        didSet {
            bookPriceLabel.tintColor = .gray
            bookPriceLabel.font = .systemFont(ofSize: 13)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
