//
//  DiscoverListViewController.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 29/03/23.
//

import UIKit

class DiscoverListTableViewCell: UITableViewCell {
    
    private lazy var booksCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let booksCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        booksCollectionView.translatesAutoresizingMaskIntoConstraints = false
        booksCollectionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        return booksCollectionView
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubviews()
        setComponentsConstraints()
        
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
    }
    
    private func addSubviews() {
        self.contentView.addSubview(booksCollectionView)
    }
    
    private func setComponentsConstraints() {
        NSLayoutConstraint.activate([
            booksCollectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            booksCollectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            booksCollectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            booksCollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}

extension DiscoverListTableViewCell: UICollectionViewDelegateFlowLayout {
    
}

extension DiscoverListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
