//
//  DiscoverBookCollectionViewCell.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 29/03/23.
//

import UIKit

class DiscoverBookCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DiscoverBookCollectionViewCell"
    
    private let defaultImage = UIImage(systemName: "text.book.closed.fill")
    private let ratingImage = UIImage(systemName: "star.leadinghalf.filled")
    private let loadingColor = UIColor.black.withAlphaComponent(0.2)

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
            
            bookTitleLabel.attributedText = NSAttributedString(string: "Book Title", attributes: [.paragraphStyle: paragraphStyle])
        }
    }
    
    @IBOutlet weak var bookRatingImageView: UIImageView! {
        didSet {
            bookRatingImageView.tintColor = .darkGray
            bookRatingImageView.image = ratingImage
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
    
    func setupCell(
        book: DiscoverBookModel?,
        cellSize: CGSize,
        isLoading: Bool = true
    ) {
        guard isLoading == false, let book = book
        else {
            showOnLoadingView()
            return
        }
        
        clearOnLoadingView()
        let imageViewSize = CGSize(
            width: cellSize.width,
            height: bookImageView.frame.height
        )
        
        bookImageView.loadImageFromUrl(book.imageUrlString, withDefault: defaultImage, targetSize: imageViewSize)
        
        bookTitleLabel.text = book.title
        bookRatingLabel.text = String(format: "%.2f", book.rating ?? 0)
        bookPriceLabel.text = book.priceString
    }
    
    private func showOnLoadingView() {
        bookImageView.image = nil
        bookTitleLabel.text = "Lorem Ipsum Dolor Sit Amet"
        bookRatingLabel.text = "4.7"
        bookPriceLabel.text = "Price Price Price Price"
        bookRatingImageView.image = nil
        
        bookImageView.image = nil
        bookImageView.backgroundColor = loadingColor
        bookTitleLabel.backgroundColor = loadingColor
        bookRatingLabel.backgroundColor = loadingColor
        bookPriceLabel.backgroundColor = loadingColor
        bookRatingImageView.backgroundColor = loadingColor
        
        bookTitleLabel.textColor = .clear
        bookPriceLabel.textColor = .clear
        bookRatingLabel.textColor = .clear
        bookRatingImageView.tintColor = .clear
    }
    
    private func clearOnLoadingView() {
        bookImageView.backgroundColor = loadingColor
        bookTitleLabel.backgroundColor = .clear
        bookRatingLabel.backgroundColor = .clear
        bookPriceLabel.backgroundColor = .clear
        bookRatingImageView.backgroundColor = .clear
        
        bookTitleLabel.textColor = .label
        bookPriceLabel.textColor = .gray
        bookRatingLabel.textColor = .gray
        
        bookRatingImageView.image = ratingImage
        bookRatingImageView.tintColor = .darkGray
    }

}
