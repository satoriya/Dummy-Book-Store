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
    
 
    private lazy var leftContainer : UIView = {
        let leftView = UILabel()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        return leftView
    }()
    
    private lazy var rightView : UIView = {
        let rightView = UILabel()
        rightView.translatesAutoresizingMaskIntoConstraints = false
        return rightView
    }()
    
    private lazy var ratingLabel : UILabel = {
        let rating = UILabel()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.textAlignment = .center
        rating.text = "4.9"
        rating.font = .systemFont(ofSize: 20, weight: .bold)
        rating.numberOfLines = 0
        return rating
    }()
    
    
    private lazy var stackViewForRatingsnumber : UIStackView = {
        let stackvw = UIStackView()
        stackvw.translatesAutoresizingMaskIntoConstraints = false
        stackvw.axis = .vertical
        stackvw.alignment = .fill
        stackvw.distribution = .fillEqually
        stackvw.spacing = 8
       return stackvw
    }()
    
    private lazy var stackViewForprogressBar: UIStackView = {
        let stackvw = UIStackView()
        stackvw.translatesAutoresizingMaskIntoConstraints = false
        stackvw.axis = .vertical
        stackvw.alignment = .fill
        stackvw.distribution = .fillEqually
        stackvw.spacing = 8
        return stackvw
    }()
    
    private lazy var reviewsLabel : UILabel = {
        let review = UILabel()
        review.translatesAutoresizingMaskIntoConstraints = false
        review.textAlignment = .center
        review.text = "(6.8k Reviews)"
        review.font = .systemFont(ofSize: 20, weight: .medium)
        review.numberOfLines = 0
        return review
    }()
    
    private lazy var ratingsButton : UIButton = {
        let rating = UIButton()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.tintColor = .orange
        
        rating.setImage(UIImage(systemName: "star.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 35)), for: .normal)
        
        return rating
    }()
    
    private lazy var rating1 : UILabel = {
        let review = UILabel()
        review.translatesAutoresizingMaskIntoConstraints = false
     
        review.text = "1"
        review.font = .systemFont(ofSize: 20, weight: .medium)
        review.numberOfLines = 0
        return review
    }()
    
    private lazy var rating2 : UILabel = {
        let review = UILabel()
        review.translatesAutoresizingMaskIntoConstraints = false
     
        review.text = "2"
        review.font = .systemFont(ofSize: 20, weight: .medium)
        review.numberOfLines = 0
        return review
    }()
    
    
    private lazy var rating3 : UILabel = {
        let review = UILabel()
        review.translatesAutoresizingMaskIntoConstraints = false
      
        review.text = "3"
        review.font = .systemFont(ofSize: 20, weight: .medium)
        review.numberOfLines = 0
        return review
    }()
    
    private lazy var rating4 : UILabel = {
        let review = UILabel()
        review.translatesAutoresizingMaskIntoConstraints = false
      
        review.text = "4"
        review.font = .systemFont(ofSize: 20, weight: .medium)
        review.numberOfLines = 0
        return review
    }()
    
    private lazy var rating5 : UILabel = {
        let review = UILabel()
        review.translatesAutoresizingMaskIntoConstraints = false
     
        review.text = "5"
        review.font = .systemFont(ofSize: 20, weight: .medium)
        review.numberOfLines = 0
        return review
    }()
    
    private lazy var progressbarfor5rating : UIProgressView = {
        let progress = UIProgressView()
        progress.progress = 0.5
        progress.progressViewStyle = .bar
        progress.progressTintColor = .orange
        progress.transform = progress.transform.scaledBy(x: 1, y: 8)
        return progress
        
    }()
    
    
    func setUpTableCell(){
        self.contentView.addSubview(ratings)
        self.contentView.addSubview(arrowImg)
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(ratingLabel)
        self.contentView.addSubview(reviewsLabel)
        stackView.addArrangedSubview(ratingsButton)
        
        
        

 
        arrowImg.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            ratings.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 15),
            ratings.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 3),
           
            
            arrowImg.topAnchor.constraint(equalTo: ratings.topAnchor),
            arrowImg.leadingAnchor.constraint(equalTo: ratings.trailingAnchor, constant: 10),
            arrowImg.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            
            
            
            ratingLabel.topAnchor.constraint(equalTo: ratings.topAnchor, constant: 30),
            ratingLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            ratingLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            
            reviewsLabel.topAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: 20),
            reviewsLabel.leadingAnchor.constraint(equalTo: ratingLabel.leadingAnchor),
   
            
//            stackView.topAnchor.constraint(equalTo: ratings.bottomAnchor, constant: 10),
//            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
//            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
//            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            
         
           
            
        ])
        
        
            }
    
}



