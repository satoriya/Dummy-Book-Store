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
        titleLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        titleLabel.textColor = UIColor(named: "Black")
        ratingLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        ratingLabel.textColor = UIColor(named: "Black")
        statusLabel.font = UIFont(name: "Poppins-Regular", size: 12)
        statusLabel.textColor = UIColor(named: "Black")
        starIcon.image = UIImage(named: "star")
        checkIcon.image = UIImage(named: "check")
        dotsIcon.image = UIImage(named: "dots")
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
