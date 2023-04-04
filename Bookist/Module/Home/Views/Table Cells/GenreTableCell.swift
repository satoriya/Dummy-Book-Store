//
//  GenreTableCell.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 29/03/23.
//

import UIKit

class GenreTableCell: UITableViewCell {

    static let identifier = "GenreTableCell"
    var genres: [BookData]?
    
    private lazy var genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(UINib(nibName: "GenreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
        cv.layer.masksToBounds = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupGenreCollectionView(genres: [BookData]?) {
        self.genres = genres
        
        DispatchQueue.main.async { [weak self] in
            self?.genreCollectionView.reloadData()
        }
        
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        
        contentView.addSubview(genreCollectionView)
        
        genreCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            genreCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            genreCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genreCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)

        ])
    }

}

extension GenreTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CellSize.genreCellWidth.rawValue, height: CellSize.genreCellHeight.rawValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = genreCollectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as? GenreCollectionViewCell else { return UICollectionViewCell() }
        guard let genres = self.genres else { return cell }
        
        cell.configureData(modelData: genres[indexPath.row])
        return cell
    }
    
    
}
