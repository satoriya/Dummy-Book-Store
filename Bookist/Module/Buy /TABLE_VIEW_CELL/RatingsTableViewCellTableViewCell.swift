//
//  RatingsTableViewCellTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 05/04/23.
//

import UIKit

class RatingsTableViewCellTableViewCell: UITableViewCell {

  static let identifier = "RatingsTableViewCell"
    var passingData : BuyPageModel?
    
    @IBOutlet weak var ratingReviewsLabel: UILabel!
    
    
    @IBOutlet weak var arrow: UIButton!{
        didSet{
            arrow.tintColor = .orange
            arrow.setTitle("", for: .normal)
            arrow.setImage(UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)), for: .normal)
        }
    }
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    @IBOutlet weak var ratingIcons: UIStackView!
    
    
    @IBOutlet weak var reviewsLabel: UILabel!
    
    
    @IBOutlet weak var container: UIView!
    
    
    
    @IBOutlet weak var ratingNumber5: UILabel!
    
    
    
    @IBOutlet weak var ratingNumber4: UILabel!
    
    
    @IBOutlet weak var ratingNumber3: UILabel!
    
    
    
    @IBOutlet weak var ratingNumber2: UILabel!
    
    
    
    @IBOutlet weak var ratingNumber1: UILabel!
    
    
    @IBOutlet weak var progressBar5: UIProgressView!
    
    
    @IBOutlet weak var progressBar4: UIProgressView!
    
    
    @IBOutlet weak var progressBar3: UIProgressView!
    
    
    
    @IBOutlet weak var progressBar2: UIProgressView!
    
    
    @IBOutlet weak var progressBar1: UIProgressView!
    
    
    
    
    
}
