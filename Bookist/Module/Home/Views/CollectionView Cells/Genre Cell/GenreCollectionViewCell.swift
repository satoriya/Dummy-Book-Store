//
//  GenreCollectionViewCell.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 29/03/23.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {

    static let identifier = "GenreCollectionViewCell"
    
    @IBOutlet weak var genreImage: UIImageView! {
        didSet {
            let tintView = UIView()
            tintView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            tintView.frame = CGRect(x: 0, y: 0, width: 2000, height: 190)
            genreImage.addSubview(tintView)
            
        }
    }
    
    @IBOutlet weak var genreTitle: UILabel! {
        didSet {
            genreTitle.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            genreTitle.textColor = .white
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

}
