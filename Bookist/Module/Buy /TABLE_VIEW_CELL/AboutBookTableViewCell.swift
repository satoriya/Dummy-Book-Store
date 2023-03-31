//
//  AboutBookTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import UIKit

class AboutBookTableViewCell: UITableViewCell {
static let identifier = "AboutBookTableViewCell"
    
    
    private lazy var container : UIView = {
        let containervw = UIView()
        containervw.translatesAutoresizingMaskIntoConstraints = false
        return containervw
    }()
    
    private lazy var stackView : UIStackView = {
        let stackvw = UIStackView()
        stackvw.translatesAutoresizingMaskIntoConstraints = false
        stackvw.axis = .vertical
        stackvw.alignment = .fill
        stackvw.distribution = .fillProportionally
        stackvw.spacing = 8
//        stackvw.layer.borderColor = UIColor.red.cgColor
//        stackvw.layer.borderWidth = 1
       return stackvw
    }()
    
    private lazy var stackViewForWrapGenres : UIStackView = {
        let stackvw = UIStackView()
        stackvw.axis = .horizontal
        stackvw.distribution = .fillProportionally
        stackvw.alignment = .fill
        stackvw.spacing = 2
        return stackvw
    }()
    
    private lazy var bookImage : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "bookCover")
        return image
    }()
    
    private lazy var bookTitle : UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.numberOfLines = 0
        title.text = "Harry Potter & The Deadly Hallows"
        return title
    }()
    
    private lazy var bookAuthor : UILabel = {
        let author = UILabel()
        author.font = .systemFont(ofSize: 14, weight: .medium)
        author.numberOfLines = 0
        author.text = "JK Rowling"
        author.textColor = .orange
        return author
    }()
    
    private lazy var datePublished : UILabel = {
        let publish = UILabel()
        publish.font = .systemFont(ofSize: 16, weight: .medium)
        publish.text = "Released On 2015"
        publish.textColor = .gray
        publish.numberOfLines = 0
        return publish
    }()
    
    private lazy var fantasyGenre : UIButton = {
        let genre1 = UIButton()
        genre1.setTitle("Fantasy ", for: .normal)
//        genre1.titleLabel?.numberOfLines = 0
        genre1.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        genre1.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        genre1.setTitleColor(.black, for: .normal)
        genre1.clipsToBounds = true
        return genre1
    }()
    
    private lazy var fictionGenre : UIButton = {
        let genre2 = UIButton()
        genre2.setTitle("Fiction", for: .normal)
        genre2.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        genre2.setTitleColor(.black, for: .normal)
        return genre2
    }()
    
    
    private lazy var mysteryGenre : UIButton = {
        let genre3 = UIButton()
        genre3.translatesAutoresizingMaskIntoConstraints = false
        genre3.setTitle("Mystery", for: .normal)
        return genre3
    }()
    
    
    private lazy var magicGenre : UIButton = {
        let genre4 = UIButton()
        genre4.translatesAutoresizingMaskIntoConstraints = false
        genre4.setTitle("Magic", for: .normal)
        return genre4
    }()
    
    
    func setUpTableCell(){
        self.contentView.addSubview(container)
        container.addSubview(stackView)
        container.addSubview(bookImage)
        stackView.addArrangedSubview(bookTitle)
        stackView.addArrangedSubview(bookAuthor)
        stackView.addArrangedSubview(datePublished)
        stackView.addArrangedSubview(stackViewForWrapGenres)
        stackViewForWrapGenres.addArrangedSubview(fantasyGenre)
        stackViewForWrapGenres.addArrangedSubview(fictionGenre)
//        stackViewForWrapGenres.addArrangedSubview(mysteryGenre)
//        stackViewForWrapGenres.addArrangedSubview(magicGenre)
        
        
 
        bookTitle.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 2),
            container.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -2),
            container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 2),
            container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -2),
            
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8),
            
            
            bookImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            bookImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
            bookImage.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -8),
            bookImage.widthAnchor.constraint(equalToConstant: 200),
            bookImage.heightAnchor.constraint(equalToConstant: 200),
            
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
