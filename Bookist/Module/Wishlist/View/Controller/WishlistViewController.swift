//
//  WishlistViewController.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import UIKit

class WishlistViewController: UIViewController {
    
    var wishlistCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        flowlayout.itemSize = CGSize(width: 340, height: 150)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        return collectionView
    }()
    
    var wishlistData = [WishlistModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupCollectionView()
        getDataWishlist()
        
        wishlistCollectionView.backgroundColor = .yellow
        
    }
    
    func getDataWishlist() {
        wishlistData.append(WishlistModel(imageBook: "harrypotter", titleBook: "Harry potter", ratingBook: 3.5, priceBook: 8))
        wishlistData.append(WishlistModel(imageBook: "thelostmetal", titleBook: "The Lost Metal", ratingBook: 3.5, priceBook: 8))
        wishlistData.append(WishlistModel(imageBook: "mostfamous", titleBook: "Most Famous Quotes", ratingBook: 4.0, priceBook: 9))
        wishlistData.append(WishlistModel(imageBook: "freelife", titleBook: "Free Life Fantacy", ratingBook: 3.8, priceBook: 7))
        wishlistCollectionView.reloadData()
    }
    
    func setupCollectionView() {
        wishlistCollectionView.dataSource = self
        wishlistCollectionView.delegate = self
        wishlistCollectionView.translatesAutoresizingMaskIntoConstraints = false
        wishlistCollectionView.register(UINib(nibName: "WishlistCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: WishlistCollectionViewCell.identifier)
    }
    
    func setupLayout() {
        view.addSubview(wishlistCollectionView)
        wishlistCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16).isActive = true
        wishlistCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        wishlistCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        wishlistCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 16).isActive = true
    }
    
}

extension WishlistViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wishlistData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WishlistCollectionViewCell.identifier, for: indexPath) as? WishlistCollectionViewCell else {
            return UICollectionViewCell()
        }
                
        cell.bookImageView.image = UIImage(named: wishlistData[indexPath.row].imageBook ?? "")
        cell.titleLabel.text = wishlistData[indexPath.row].titleBook ?? ""
        cell.ratingLabel.text = "\(wishlistData[indexPath.row].ratingBook ?? 0)"
        cell.priceBookLabel.text = "$\(wishlistData[indexPath.row].priceBook ?? 0)"
        cell.bookImageView.layer.cornerRadius = 8
        return cell
    }
}

