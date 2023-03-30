//
//  ItemTableCell.swift
//  Bookist
//
//  Created by Farhan on 29/03/23.
//

import UIKit

class ItemTableCell: UITableViewCell {
    
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var starIcon: UIImageView!
    @IBOutlet weak var checkIcon: UIImageView!
    @IBOutlet weak var dotsIcon: UIImageView!
    
    static let identifier = "ItemTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCells()
    }
    
    func setupCells() {
        // img
        imgLabel.layer.cornerRadius = 10
        
        // titleLabel
        titleLabel.text = "Harry Potter and The Chamber of Secrets"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .left
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.preferredMaxLayoutWidth = 200
        
        // ratingLabel
        ratingLabel.text = "4.5"
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 14)
        ratingLabel.textColor = UIColor.gray
        ratingLabel.numberOfLines = 1
        ratingLabel.textAlignment = .left
        ratingLabel.lineBreakMode = .byWordWrapping
        ratingLabel.preferredMaxLayoutWidth = 50
        
        // statusLabel
        statusLabel.text = "Purchased"
        statusLabel.font = UIFont.boldSystemFont(ofSize: 14)
        statusLabel.textColor = UIColor.gray
        statusLabel.numberOfLines = 1
        statusLabel.textAlignment = .left
        statusLabel.lineBreakMode = .byWordWrapping
        statusLabel.preferredMaxLayoutWidth = 100
        
        // starIcon
        starIcon.tintColor = UIColor.gray
        
        // checkIcon
        checkIcon.tintColor = UIColor(rgb: 0xEEBC1D)
        
        // dotsIcon
        dotsIcon.tintColor = UIColor.gray
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
