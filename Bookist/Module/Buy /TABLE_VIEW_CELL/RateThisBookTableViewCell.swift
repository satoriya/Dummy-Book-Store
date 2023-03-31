//
//  RateTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 31/03/23.
//

import UIKit

class RateThisBookTableViewCell: UITableViewCell {
    static let identifier = "RateThisBookTableViewCell"
    
    
    private lazy var stackView : UIStackView = {
        let stackVw = UIStackView()
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        stackVw.axis = .vertical
        stackVw.alignment = .center
        stackVw.spacing = 20
        stackVw.distribution = .fill
        
        return stackVw
    }()
    
    private lazy var rateLabel : UILabel = {
        let ratelb = UILabel()
        ratelb.translatesAutoresizingMaskIntoConstraints = false
        ratelb.numberOfLines = 0
        ratelb.font = .systemFont(ofSize: 18, weight: .medium)
        ratelb.textColor = .black
        ratelb.text = "Rate This Book"
        return ratelb
    }()

    private lazy var ratings : UIButton = {
        let rating = UIButton()
        rating.translatesAutoresizingMaskIntoConstraints = false
        rating.setImage(UIImage(systemName: "star",withConfiguration:UIImage.SymbolConfiguration(pointSize: 18)), for: .normal)
        return rating
    }()
    
    
    private lazy var writeReview : UIButton = {
        let review = UIButton()
        review.translatesAutoresizingMaskIntoConstraints = false
        review.setTitle("Write a Review", for: .normal)
        review.setTitleColor(.orange, for: .normal)
        review.layer.borderColor = UIColor.orange.cgColor
        review.layer.borderWidth = 0.7
        review.layer.cornerRadius = 20
        
        review.clipsToBounds = true
        
        return review
    }()
    
    
    func setUpTable(){
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(rateLabel)
        stackView.addArrangedSubview(ratings)
        stackView.addArrangedSubview(writeReview)
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 50),
                                     stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 50),
                                     stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -50),
                                     stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -50),
                                     
                                     writeReview.widthAnchor.constraint(equalToConstant: 150),
                                     writeReview.heightAnchor.constraint(equalToConstant: 50)
                                    
                                    ])
    }
    
}
