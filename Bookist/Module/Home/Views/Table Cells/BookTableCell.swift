//
//  BookTableCell.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 29/03/23.
//

import UIKit

class BookTableCell: UITableViewCell {

    static let identifier = "BookTableCell"
    var books: [BookData]?
    
    private lazy var bookCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(UINib(nibName: "BookCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
        cv.layer.masksToBounds = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupBookCollectionView(bookItems: [BookData]?) {
        self.books = bookItems
        print("BookTableCell Data: \(self.books)")

        DispatchQueue.main.async { [weak self] in
            self?.bookCollectionView.reloadData()
        }
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        
        contentView.addSubview(bookCollectionView)
        
        bookCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bookCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bookCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bookCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)

        ])
    }
    
}

extension BookTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 2.3, height: CellSize.bookCellHeight.rawValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Books count: \(books?.count ?? 0)")
        return books?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bookCollectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as? BookCollectionViewCell else { return UICollectionViewCell() }
        guard let books = books else { return cell }
        
        cell.configureData(bookModel: books[indexPath.row])
        return cell
    }
    
    
}
