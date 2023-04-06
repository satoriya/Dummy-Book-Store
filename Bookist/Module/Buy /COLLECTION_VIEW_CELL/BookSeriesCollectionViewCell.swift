//
//  BookSeriesCollectionViewCell.swift
//  Bookist
//
//  Created by Phincon on 02/04/23.
//

import UIKit

class BookSeriesCollectionViewCell: UICollectionViewCell {

static let identifier = "BookSeriesCollectionViewCell"

    @IBOutlet weak var bookSeriesIMG: UIImageView!
    
    
    @IBOutlet weak var bookSeriesTitle: UILabel!
    
    
    @IBOutlet weak var bookSeriesIcon: UIImageView!
    
    
    @IBOutlet weak var bookSeriesRating: UILabel!
    
    @IBOutlet weak var bookSeriesPrice: UILabel!
    
    
    func setUpCollectionCell(bookSeries : BuyPageModel)
    {
        bookSeriesIMG.sd_setImage(with: URL(string: bookSeries.image))
        bookSeriesTitle.text = bookSeries.title
        bookSeriesPrice.text = "\(bookSeries.price)"
      
    }
    
    
}
