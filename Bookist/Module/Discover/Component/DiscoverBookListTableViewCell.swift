//
//  DiscoverBookListTableViewCell.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 29/03/23.
//

import UIKit

class DiscoverBookListTableViewCell: UITableViewCell {
    
    static let identifier = "DiscoverBookListTableViewCell"
    
    private let verticalSpacing: CGFloat = 10
    private let horizontalSpacing: CGFloat = 18
    private let collectionHeight: CGFloat = 340
    
    private var showLimit: Int?
    private var discoverBooks: [DiscoverBookModel]?
    private var isLoading: Bool = true
    
    var availableScreenWidth: CGFloat {
        return self.contentView.bounds.width - horizontalSpacing * 2
    }
    
    private lazy var booksCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let booksCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        booksCollectionView.translatesAutoresizingMaskIntoConstraints = false
        booksCollectionView.heightAnchor.constraint(equalToConstant: collectionHeight).isActive = true
        
        return booksCollectionView
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(
        discoverBooks: [DiscoverBookModel]? = nil,
        showLimit: Int? = nil,
        isLoading: Bool = true
    ) {
        if isLoading == false {
            self.isLoading = false
            self.discoverBooks = discoverBooks
            self.showLimit = showLimit
            self.booksCollectionView.reloadData()
        }
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubviews()
        setComponentsConstraints()
        
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
        booksCollectionView.showsHorizontalScrollIndicator = false
        
        let discoverBookCell = UINib(nibName: DiscoverBookCollectionViewCell.identifier, bundle: nil)
        booksCollectionView.register(discoverBookCell, forCellWithReuseIdentifier: DiscoverBookCollectionViewCell.identifier)
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
    
    private func cellItemSize() -> CGSize {
        let itemWidth = (availableScreenWidth - horizontalSpacing) / 2
        let itemHeight = collectionHeight - verticalSpacing * 2
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension DiscoverBookListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: verticalSpacing,
            left: horizontalSpacing,
            bottom: verticalSpacing,
            right: horizontalSpacing
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellItemSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return horizontalSpacing
    }
    
}

extension DiscoverBookListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let discoverBooks = self.discoverBooks,
              let showLimit = self.showLimit
        else { return 3 }
        
        let showCount = discoverBooks.count > showLimit ? showLimit : discoverBooks.count
        return showCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let discoverBookCell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverBookCollectionViewCell.identifier, for: indexPath) as? DiscoverBookCollectionViewCell
        else { return UICollectionViewCell() }
        
        
        discoverBookCell.setupCell(
            book: discoverBooks?[indexPath.row],
            cellSize: cellItemSize(),
            isLoading: self.isLoading
        )
        
        return discoverBookCell
    }
}
