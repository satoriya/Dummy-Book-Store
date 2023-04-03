//
//  SimilarEbooksTableViewCell.swift
//  Bookist
//
//  Created by Phincon on 03/04/23.
//

import UIKit

class SimilarEbooksTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    static let identifier = "SimilarEbooksTableViewCell"
  
    @IBOutlet weak var similarEbooksTitle: UILabel!
    
    @IBOutlet weak var arrowButton: UIButton!{
        didSet{
            arrowButton.tintColor = .orange
            arrowButton.setImage(UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15)), for: .normal)
        }
        
    }
    
    
    @IBOutlet weak var collectionViewInsideTableCell: UICollectionView!
    
    
    func setUpTableCell(similarBooks : SimilarBook){
    
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.itemSize = CGSize(width: 200, height: 300)
        flowlayout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        
        collectionViewInsideTableCell.collectionViewLayout = flowlayout
        collectionViewInsideTableCell.dataSource = self
        collectionViewInsideTableCell.delegate = self
        collectionViewInsideTableCell.register(UINib(nibName: BookSeriesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: "BookSeriesCollectionViewCell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookSeriesCollectionViewCell.identifier, for: indexPath) as? BookSeriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 230)
    }
    
    
    
    
}
