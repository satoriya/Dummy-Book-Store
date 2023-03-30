//
//  BookRatingTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 30/03/23.
//

import UIKit

class BookRatingTableViewCell: UITableViewCell {
    static let identifier = "BookRatingTableViewCell"
    
    
    private lazy var ratingScore : UILabel = {
        let score = UILabel()
        score.translatesAutoresizingMaskIntoConstraints = false
        return score
    }()
    
    
    private lazy var reviewBook : UILabel = {
        let review = UILabel()
        review.translatesAutoresizingMaskIntoConstraints = false
        return review
    }()
    
    private lazy var sizeofMemory : UILabel = {
        let size = UILabel()
        size.translatesAutoresizingMaskIntoConstraints = false
        return size
    }()
    
    private lazy var sizeLabel : UILabel = {
        let sizelb = UILabel()
        sizelb.translatesAutoresizingMaskIntoConstraints = false
        return sizelb
    }()
    
    private lazy var bookPages : UILabel = {
        let pages = UILabel()
        pages.translatesAutoresizingMaskIntoConstraints = false
        return pages
    }()
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
