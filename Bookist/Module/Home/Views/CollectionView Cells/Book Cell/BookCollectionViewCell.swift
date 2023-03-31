//
//  BookCollectionViewCell.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 29/03/23.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BookCollectionViewCell"
    
    @IBOutlet weak var bookImage: UIImageView! {
        didSet {
            bookImage.layer.cornerRadius = 10
            bookImage.backgroundColor = .gray
            bookImage.translatesAutoresizingMaskIntoConstraints = false
            bookImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
    }
    @IBOutlet weak var bookTitle: UILabel! {
        didSet {
            bookTitle.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        }
    }
    @IBOutlet weak var starImage: UIImageView! {
        didSet {
            starImage.tintColor = .systemYellow
        }
    }
    @IBOutlet weak var rating: UILabel! {
        didSet {
            rating.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            rating.textColor = .secondaryLabel
        }
    }
    @IBOutlet weak var price: UILabel! {
        didSet {
            price.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            price.textColor = .secondaryLabel
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureData(bookModel: BookData?) {
        let targetImageSize = CGSize(width: self.frame.width, height: bookImage.frame.height)
        
        
        bookTitle.text = bookModel?.title
        guard let url = bookModel?.image else {
            return
        }
        bookImage.downloaded(from: url, targetSize: targetImageSize)
        guard let price = bookModel?.price else { return }
        
        if price.first == "$" {
            self.price.text = price
        } else {
            let intPrice = Double(price)
            self.price.text = "Rp.\(String().df2so(intPrice ?? 0))"
        }
        
       
        
        rating.text = "\(bookModel?.rating ?? 0.0)"
    }

}
