//
//  WishlistViewController.swift
//  Bookist
//
//  Created by Phincon on 29/03/23.
//

import UIKit
import SDWebImage

class WishlistViewController: UIViewController {
    
    var wishlistCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        flowlayout.itemSize = CGSize(width: 380, height: 180)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        return collectionView
    }()
    
    var viewModel: WishlistViewModel?
    var wishlist: WishlistModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Wishlist"
        navigationController?.navigationBar.prefersLargeTitles = false
        
       
        //        getDataWishlist()
        configureNavBar()
        wishlistCollectionView.backgroundColor = .white
        
        self.viewModel = WishlistViewModel(urlString : "http://localhost:3003", apiService: GetWishlistApi())

        self.viewModel?.bindWishlistData = {wishlistDataModel in
            print("this is the data: \(wishlistDataModel)")
            if let wishlistDataModel = wishlistDataModel{
                self.wishlist = wishlistDataModel
                self.wishlistCollectionView.backgroundColor = .white
            } else {
                self.wishlistCollectionView.backgroundColor = .white
            }
            DispatchQueue.main.async {
                self.wishlistCollectionView.reloadData()
            }
        }
        setupLayout()
        setupCollectionView()
    }
    //NavBar
    private func configureNavBar(){
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.prefersLargeTitles = false
       
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "line.horizontal.3"),
                style: .plain,
                target: self,
                action: nil ),
            
            UIBarButtonItem(
                image: UIImage(systemName: "magnifyingglass"),
                style: .plain,
                target: self,
                action: nil) ]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "book"), style: .plain, target: self, action: nil
        )}
    
    func setupCollectionView() {
        wishlistCollectionView.dataSource = self
        wishlistCollectionView.delegate = self
        wishlistCollectionView.translatesAutoresizingMaskIntoConstraints = false
        wishlistCollectionView.register(UINib(nibName: "WishlistCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: WishlistCollectionViewCell.identifier)}
    
    func setupLayout() {
        view.addSubview(wishlistCollectionView)
        wishlistCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        wishlistCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        wishlistCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        wishlistCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 16).isActive = true
    }
}
//    func getDataWishlist() {
//        wishlistData.append(WishlistModel(imageBook: "harrypotter", titleBook: "Harry potter the Pheonix", ratingBook: 3.5, priceBook: 8))
//        wishlistData.append(WishlistModel(imageBook: "pokemon", titleBook: "Pokemon Adventure", ratingBook: 3.5, priceBook: 8))
//        wishlistData.append(WishlistModel(imageBook: "mostfamous", titleBook: "Most Famous Quotes", ratingBook: 4.0, priceBook: 9))
//        wishlistData.append(WishlistModel(imageBook: "freelife", titleBook: "Free Life Fantacy", ratingBook: 3.8, priceBook: 7))
//        wishlistData.append(WishlistModel(imageBook: "itsstartswithus", titleBook: "It Starts With US", ratingBook: 4.0, priceBook: 10))
//        wishlistCollectionView.reloadData()
//    }
extension WishlistViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = wishlist?.data.items.count {
            print(count)
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WishlistCollectionViewCell.identifier, for: indexPath) as? WishlistCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let items = wishlist?.data.items else { return UICollectionViewCell()}
        
        cell.bookImageView.sd_setImage(with: URL(string: items[indexPath.row].image))
        cell.titleLabel.text = items[indexPath.row].title
        cell.ratingLabel.text = "\(wishlist?.data.items[indexPath.row].rating ?? 0)"
        cell.priceBookLabel.text = "$\(wishlist?.data.items[indexPath.row].price ?? 0)"
        cell.bookImageView.layer.cornerRadius = 8
        //  cell.bookImageView.image = UIImage(named: wishlistData[indexPath.row].imageBook ?? "")
        //  cell.titleLabel.text = wishlistData[indexPath.row].titleBook ?? ""
        //  cell.ratingLabel.text = "\(wishlistData[indexPath.row].ratingBook ?? 0)"
        //  cell.priceBookLabel.text = "$\(wishlistData[indexPath.row].priceBook ?? 0)"
        //   cell.bookImageView.layer.cornerRadius = 8
        return cell
    }
}
