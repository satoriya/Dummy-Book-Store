//
//  BookSeriesTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 02/04/23.
//

import UIKit

class BookSeriesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    var passingData: BuyPageModel?
    
    static let identifier = "BookSeriesTableViewCell"
    
    @IBOutlet weak var bookSeriesCollectionViewInsideTableCell: UICollectionView!
    
    @IBOutlet weak var bookSeriesTitle: UILabel!
    
    @IBOutlet weak var arrowButton: UIButton!{
        didSet{
            arrowButton.tintColor = .orange
            arrowButton.setImage(UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)), for: .normal)
            arrowButton.setTitle("", for: .normal)
        }
    }
    
    func setUpTableCell(){
        
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.itemSize = CGSize(width: 200, height: 300)
        flowlayout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        
        
        bookSeriesCollectionViewInsideTableCell?.collectionViewLayout = flowlayout
        bookSeriesCollectionViewInsideTableCell?.dataSource = self
        bookSeriesCollectionViewInsideTableCell?.delegate = self
        bookSeriesCollectionViewInsideTableCell?.register(UINib(nibName: BookSeriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: "BookSeriesCollectionViewCell")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return passingData?.similarBooks[0].data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 230)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let similarBook = passingData?.similarBooks[0].data[indexPath.row],
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookSeriesCollectionViewCell.identifier, for: indexPath) as? BookSeriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.bookSeriesTitle.text = similarBook.title
        cell.bookSeriesPrice.text = "\(similarBook.price ?? 0)"
        cell.bookSeriesRating.text = "\(similarBook.rating ?? 0)"
        cell.bookSeriesIMG.sd_setImage(with:URL(string: similarBook.image ?? ""))
        return cell
    }
}
