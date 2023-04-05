//
//  HarryPotterCollectionViewCell.swift
//  Bookist
//
//  Created by Phincon on 31/03/23.
//

import UIKit

class BookSeriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BookSeriesCollectionViewCell"
    
    @IBOutlet weak var bookIMG: UIImageView!
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var ratingLabel: UIImageView!
    
    @IBOutlet weak var bookRating: UILabel!
    
    @IBOutlet weak var bookPrice: UILabel!
}
