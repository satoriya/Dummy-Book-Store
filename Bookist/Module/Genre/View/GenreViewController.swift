//
//  GenreViewController.swift
//  Bookist
//
//  Created by Alief Ahmad Azies on 29/03/23.
//

import UIKit

var isListView = false

class GenreViewController: UIViewController {
    
    private var genre: GenreResponse?
    
    var viewModel: GenreViewModel?
    
    var tagList: [String] = ["Fantasy", "Sci-Fi", "Kids"]
    
    let headerView: UIView = {
        let vw = UIView()
        return vw
    }()
    
    let backButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    let genreLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    var searchButton: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        return btn
    }()
    
    var filterButton: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        return btn
    }()
    
    let subHeaderView: UIView = {
        let vw = UIView()
        return vw
    }()
    
    let showOnLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Show On"
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lb
    }()
    
    let gridButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "square.grid.2x2.fill"), for: .normal)
        btn.tintColor = .orange
        return btn
    }()
    
    let listButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "rectangle.grid.1x2"), for: .normal)
        btn.tintColor = UIColor.orange
        return btn
    }()
    
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.viewModel = GenreViewModel(urlString: "http://localhost:3002/genre/programming", apiService: ApiServiceGenre())
        
        self.viewModel?.bindData = { genreData in
            if let genreData = genreData {
                self.genre = genreData
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Genre"
        setup()
    }
    
    func setup() {
        view.backgroundColor = .systemBackground
        
        let searchBarButton: UIButton = UIButton.init(type: .custom)
        searchBarButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchBarButton.addTarget(self, action: #selector(searchBarButtonTapped(_ :)), for: .touchUpInside)
        searchBarButton.tintColor = .label
        searchBarButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let searchBarButtonItem = UIBarButtonItem(customView: searchBarButton)
        
        let filterBarButton: UIButton = UIButton.init(type: .custom)
        filterBarButton.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        filterBarButton.addTarget(self, action: #selector(filterBarButtonTapped(_ :)), for: .touchUpInside)
        filterBarButton.tintColor = .label
        filterBarButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let filterBarButtonItem = UIBarButtonItem(customView: filterBarButton)
        
        navigationItem.setRightBarButtonItems([filterBarButtonItem, searchBarButtonItem], animated: true)
        
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        headerView.addSubview(showOnLabel)
        showOnLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showOnLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            showOnLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        headerView.addSubview(gridButton)
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
            gridButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),
            gridButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16)
        ])
        gridButton.addTarget(self, action: #selector(gridButtonTapped(_:)), for: .touchUpInside)
        
        headerView.addSubview(listButton)
        listButton.translatesAutoresizingMaskIntoConstraints = false
        listButton.addTarget(self, action: #selector(listButtonTapped(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            listButton.trailingAnchor.constraint(equalTo: gridButton.leadingAnchor, constant: -16),
            listButton.centerYAnchor.constraint(equalTo: gridButton.centerYAnchor),
        ])
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "BookGridCell", bundle: nil), forCellWithReuseIdentifier: "bookcell")
        collectionView.register(BookListCell.self, forCellWithReuseIdentifier: "booklist")
        
    }
    
    @objc func searchBarButtonTapped(_ sender: Any) {
        
    }
    
    @objc func filterBarButtonTapped(_ sender: Any) {
        
    }
    
    @objc func gridButtonTapped(_ sender: Any) {
        gridButton.setImage(UIImage(systemName: "square.grid.2x2.fill"), for: .normal)
        listButton.setImage(UIImage(systemName: "rectangle.grid.1x2"), for: .normal)
        isListView = false
        self.collectionView.reloadData()
    }
    
    @objc func listButtonTapped(_ sender: Any) {
        listButton.setImage(UIImage(systemName: "rectangle.grid.1x2.fill"), for: .normal)
        gridButton.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        isListView = true
        self.collectionView.reloadData()
    }
    
}

extension GenreViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isListView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "booklist", for: indexPath) as? BookListCell else { return UICollectionViewCell() }
            
            cell.setupUI()
            guard let genreItem = genre?.data.items[indexPath.row] else { return UICollectionViewCell() }
            cell.setupListCell(item: genreItem)
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookcell", for: indexPath) as? BookGridCell else { return UICollectionViewCell()}
            
            guard let genreItem = genre?.data.items[indexPath.row] else { return UICollectionViewCell() }
            
            cell.setupGridCell(item: genreItem)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genre?.data.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isListView {
            return CGSize(width: collectionView.frame.size.width / 1.1, height: collectionView.frame.size.height / 4.2)
        }
        else {
            return CGSize(width: UIScreen.main.bounds.width / 2.17, height: UIScreen.main.bounds.height / 2.6)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if isListView {
            return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        }
        else {
            return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        }
        
    }
}
