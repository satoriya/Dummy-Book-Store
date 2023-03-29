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
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
