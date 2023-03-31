//
//  RatingsTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 31/03/23.
//

import UIKit

class RatingsTableViewCell: UITableViewCell {
    static let identifier = "RatingsTableViewCell"
    
    private lazy var ratings : UILabel = {
        let rating = UILabel()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.text = "Ratings & Reviews"
        rating.font = .systemFont(ofSize: 20, weight: .bold)
        rating.numberOfLines = 0
        return rating
    }()
    
    private lazy var arrowImg : UIButton = {
        let img = UIButton()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.setImage(UIImage(systemName: "arrow.right",withConfiguration:UIImage.SymbolConfiguration(pointSize: 15)), for: .normal)
        img.tintColor = .orange
        return img
    }()
    
    private lazy var stackView : UIStackView = {
        let stackvw = UIStackView()
        stackvw.translatesAutoresizingMaskIntoConstraints = false
        stackvw.axis = .horizontal
        stackvw.alignment = .fill
        stackvw.distribution = .fillProportionally
        stackvw.spacing = 8
       return stackvw
    }()
    
    private lazy var rightStackView : UIStackView = {
        let stackvw = UIStackView()
        stackvw.translatesAutoresizingMaskIntoConstraints = false
        stackvw.axis = .vertical
        stackvw.alignment = .fill
        stackvw.distribution = .fillProportionally
        stackvw.spacing = 8
       return stackvw
    }()
    
    private lazy var leftStackView : UIStackView = {
        let stackvw = UIStackView()
        stackvw.translatesAutoresizingMaskIntoConstraints = false
        stackvw.axis = .vertical
        stackvw.alignment = .fill
        stackvw.distribution = .fillProportionally
        stackvw.spacing = 8
       return stackvw
    }()
    
    private lazy var ratingLabel : UILabel = {
        let rating = UILabel()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.text = "4.9"
        rating.font = .systemFont(ofSize: 20, weight: .bold)
        rating.numberOfLines = 0
        return rating
    }()
    
    
    private lazy var stackViewForRatings : UIStackView = {
        let stackvw = UIStackView()
        stackvw.translatesAutoresizingMaskIntoConstraints = false
        stackvw.axis = .horizontal
        stackvw.alignment = .fill
        stackvw.distribution = .fillProportionally
        stackvw.spacing = 8
       return stackvw
    }()
    
    
    private lazy var reviewsLabel : UILabel = {
        let review = UILabel()
        review.translatesAutoresizingMaskIntoConstraints = false
        review.text = "(6.8k Reviews)"
        review.font = .systemFont(ofSize: 20, weight: .bold)
        review.numberOfLines = 0
        return review
    }()
    
    
    
    func setUpTableCell(){
        self.contentView.addSubview(ratings)
        self.contentView.addSubview(arrowImg)
        self.contentView.addSubview(stackView)
        stackView.backgroundColor = .blue
        stackView.addArrangedSubview(leftStackView)
        stackView.addArrangedSubview(rightStackView)
//        leftStackView.addArrangedSubview(ratingLabel)
//        leftStackView.addArrangedSubview(reviewsLabel)
        arrowImg.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            ratings.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            ratings.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 3),
           
            
            arrowImg.topAnchor.constraint(equalTo: ratings.topAnchor),
            arrowImg.leadingAnchor.constraint(equalTo: ratings.trailingAnchor, constant: 10),
            arrowImg.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            
            stackView.topAnchor.constraint(equalTo: ratings.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
            
        ])
        
        
            }
    
}



