//
//  WishlistCollectionViewCell.swift
//  Bookist
//
//  Created by Phincon on 30/03/23.
//

import UIKit

class WishlistCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "WishlistCollectionViewCell"

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var bookImageView: UIImageView! 
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceBookLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var dotsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.backgroundColor = .white
        
        bookImageView.contentMode = .scaleAspectFill        
        bookImageView.layer.cornerRadius = 15
        bookImageView.layer.masksToBounds = true
        bookImageView.backgroundColor = .lightGray
        
        dotsButton.setImage(UIImage(named: "dots"), for: .normal)
    }
}
