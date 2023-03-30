//
//  BookRatingTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 30/03/23.
//

import UIKit

class BookRatingTableViewCell: UITableViewCell {
    static let identifier = "BookRatingTableViewCell"
    
//    private lazy var container : UIView = {
//        let containervw = UIView()
//        containervw.translatesAutoresizingMaskIntoConstraints = false
//        return containervw
//    }()
    
    private lazy var stackView : UIStackView = {
        let stackVw = UIStackView()
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        stackVw.axis = .horizontal
        stackVw.alignment = .fill
        stackVw.spacing = 20
        stackVw.distribution = .fillEqually
        return stackVw
    }()
    
    private lazy var stackView2 : UIStackView = {
        let stackVw = UIStackView()
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        stackVw.axis = .horizontal
        stackVw.alignment = .fill
        stackVw.spacing = 20
        stackVw.distribution = .fillEqually
        return stackVw
    }()
    
    private lazy var ratingScore : UILabel = {
        let score = UILabel()
        score.translatesAutoresizingMaskIntoConstraints = false
        score.text = "4.9"
        score.font = .systemFont(ofSize: 22, weight: .medium)
        score.textAlignment = .center
        return score
    }()
    
    
    private lazy var reviewBook : UILabel = {
        let review = UILabel()
        review.translatesAutoresizingMaskIntoConstraints = false
        review.numberOfLines = 0
        review.text = "6.8K Reviews"
        review.textAlignment = .center
        review.font = .systemFont(ofSize: 10, weight: .light)
        return review
    }()
    
    private lazy var sizeofMemory : UILabel = {
        let size = UILabel()
        size.translatesAutoresizingMaskIntoConstraints = false
        size.text = "5.6 MB"
        size.textAlignment = .center
        size.font = .systemFont(ofSize: 22, weight: .medium)
        return size
    }()
    
    private lazy var sizeLabel : UILabel = {
        let sizelb = UILabel()
        sizelb.translatesAutoresizingMaskIntoConstraints = false
        sizelb.text = "size"
        sizelb.font = .systemFont(ofSize: 10, weight: .light)
        sizelb.textAlignment = .center
        return sizelb
    }()
    
    private lazy var bookPages : UILabel = {
        let pages = UILabel()
        pages.text = "784"
        pages.translatesAutoresizingMaskIntoConstraints = false
        pages.font = .systemFont(ofSize: 22, weight: .medium)
        pages.textAlignment = .center
        return pages
    }()
    
    private lazy var pageLabel : UILabel = {
        let pagelb = UILabel()
        pagelb.translatesAutoresizingMaskIntoConstraints = false
        pagelb.font = .systemFont(ofSize: 10, weight: .light)
        pagelb.text = "pages"
        pagelb.textAlignment = .center
        return pagelb
    }()
    
    private lazy var purchasesBook : UILabel = {
        let purchase = UILabel()
        purchase.translatesAutoresizingMaskIntoConstraints = false
        purchase.text = "500M +"
        purchase.textAlignment = .center
        purchase.font = .systemFont(ofSize: 22, weight: .medium)
        return purchase
    }()
    
    private lazy var purchasesLabel : UILabel = {
        let purchaselb = UILabel()
        purchaselb.translatesAutoresizingMaskIntoConstraints = false
        purchaselb.text = "purchases"
        purchaselb.font = .systemFont(ofSize: 10, weight: .light)
        purchaselb.textAlignment = .center
        return purchaselb
    }()
    
    private lazy var buyBookBotton : UIButton = {
        let BuyBotton = UIButton()
        BuyBotton.translatesAutoresizingMaskIntoConstraints = false
        BuyBotton.backgroundColor = .orange
        BuyBotton.setTitle("Buy USD $9,99", for: .normal)
        BuyBotton.layer.cornerRadius = 10
        BuyBotton.clipsToBounds = true
        
        return BuyBotton
    }()
    
    
    func setUpBookingTableCell(){
//        self.addSubview(container)
//        container.addSubview(stackView)
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(stackView2)
        self.contentView.addSubview(buyBookBotton)
        stackView.addArrangedSubview(ratingScore)
        stackView.addArrangedSubview(sizeofMemory)
        stackView.addArrangedSubview(bookPages)
        stackView.addArrangedSubview(purchasesBook)
//        stackView.layer.borderColor = UIColor.red.cgColor
//        stackView.layer.borderWidth = 1
        
        
        stackView2.addArrangedSubview(reviewBook)
        stackView2.addArrangedSubview(sizeLabel)
        stackView2.addArrangedSubview(pageLabel)
        stackView2.addArrangedSubview(purchasesLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 2),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -2),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 2),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -2),
                                   
            stackView2.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 50),
            stackView2.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -2),
            stackView2.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 2),
            stackView2.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -2),
            
            
            buyBookBotton.widthAnchor.constraint(equalToConstant: 300),
            buyBookBotton.heightAnchor.constraint(equalToConstant: 50),
            buyBookBotton.topAnchor.constraint(equalTo: stackView2.topAnchor, constant: 75),
            buyBookBotton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -2),
            buyBookBotton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 2),
            buyBookBotton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2)
                                    ])
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
