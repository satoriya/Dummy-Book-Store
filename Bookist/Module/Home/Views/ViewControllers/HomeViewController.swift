//
//  HomeViewController.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 29/03/23.
//

import UIKit

enum Sections: Int {
    case top = 0, genres, recommended, new, wishlist
}

class HomeViewController: UIViewController {

    let sectionTitles = ["Explore By Genre", "Recommended For You", "On Your Purchased", "On Your Wishlist"]
    var bookData: Book?
    var homeVM: HomeProtocol?
    
    
    private lazy var homeTable: UITableView = {
        let tb = UITableView(frame: .zero, style: .grouped)
        tb.translatesAutoresizingMaskIntoConstraints = false
        
        tb.register(HeaderTableCell.self, forHeaderFooterViewReuseIdentifier: HeaderTableCell.identifier)
        tb.register(BookTableCell.self, forCellReuseIdentifier: BookTableCell.identifier)
        tb.register(GenreTableCell.self, forCellReuseIdentifier: GenreTableCell.identifier)
        
        return tb
    }()
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVM = HomeViewModel(apiServiceProtocol: APIService())
        
        callAPI()
        setupTable()
        setupNavigationBar()
        
    }

    func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        title = ""
        
        let appIcon = UIImage(systemName: "text.book.closed")
        appIcon?.withTintColor(UIColor(named: "styleColor") ?? UIColor.orange, renderingMode: .alwaysOriginal)
        
        
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: appIcon, style: .done, target: self, action: nil),
            UIBarButtonItem(title: "Erabook", style: .done, target: self, action: nil)
        ]
            
        let searchImage = UIImage(systemName: "magnifyingglass")!
        let pencilImage = UIImage(systemName: "bell")!

        let searchBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchBtn.setImage(searchImage, for: .normal)

        searchBtn.tintColor = .label
        searchBtn.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        searchBtn.frame = CGRectMake(0, 0, 30, 30)
        let searchBarBtn = UIBarButtonItem(customView: searchBtn)


        let pencilBtn: UIButton = UIButton(type: UIButton.ButtonType.custom)
        pencilBtn.setImage(pencilImage, for: .normal)
        pencilBtn.tintColor = .label
        pencilBtn.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        pencilBtn.frame = CGRectMake(0, 0, 30, 30)
        let pencilBarBtn = UIBarButtonItem(customView: pencilBtn)

        self.navigationItem.rightBarButtonItems = [searchBarBtn, pencilBarBtn]

    }
    
    @objc
    func didClickButton(sender: UIButton) {
        print("clicked")
    }
    
    func setupTable() {
        view.addSubview(homeTable)
        
        homeTable.backgroundColor = .systemBackground
        homeTable.separatorStyle = .singleLine
        homeTable.tableFooterView = UIView(frame: CGRect.zero)
        homeTable.sectionFooterHeight = 0.0
        
        NSLayoutConstraint.activate([
            homeTable.topAnchor.constraint(equalTo: view.topAnchor),
            homeTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        homeTable.delegate = self
        homeTable.dataSource = self
    }
    
    func callAPI() {
        
        homeVM?.bookDataBinding = { books in
            self.bookData = books
            print("This is books: \(self.bookData)")
        }
        DispatchQueue.main.async { [weak self] in
            self?.homeTable.reloadData()
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section > 0 {
            let header = homeTable.dequeueReusableHeaderFooterView(withIdentifier: HeaderTableCell.identifier) as? HeaderTableCell
            header?.addSubviews()
            header?.configure(title: bookData?.data.items[section-1].cover ?? "")
            return header

        } else {
            return UITableViewHeaderFooterView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 80
        } else {
            return 310
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = Sections(rawValue: indexPath.section)
        
        switch sections {
        case .top:
            guard let topCell = homeTable.dequeueReusableCell(withIdentifier: BookTableCell.identifier, for: indexPath) as? BookTableCell else { return UITableViewCell() }
            topCell.setupBookCollectionView(bookItems: self.bookData?.data.items[1].data)
            return topCell
            
        case .genres:
            guard let genreCell = homeTable.dequeueReusableCell(withIdentifier: GenreTableCell.identifier, for: indexPath) as? GenreTableCell else { return UITableViewCell() }
            genreCell.setupGenreCollectionView(genres: self.bookData?.data.items[0].data)
            return genreCell
            
        case .recommended:
            guard let recdCell = homeTable.dequeueReusableCell(withIdentifier: BookTableCell.identifier, for: indexPath) as? BookTableCell else { return UITableViewCell() }
            recdCell.setupBookCollectionView(bookItems: self.bookData?.data.items[1].data)
            return recdCell

        case .new:
            guard let purchasedCell = homeTable.dequeueReusableCell(withIdentifier: BookTableCell.identifier, for: indexPath) as? BookTableCell else { return UITableViewCell() }
            purchasedCell.setupBookCollectionView(bookItems: self.bookData?.data.items[2].data)
            return purchasedCell

            
        case .wishlist:
            guard let wishlistCell = homeTable.dequeueReusableCell(withIdentifier: BookTableCell.identifier, for: indexPath) as? BookTableCell else { return UITableViewCell() }
            wishlistCell.setupBookCollectionView(bookItems: self.bookData?.data.items[3].data)
            return wishlistCell


        default:
            return UITableViewCell()
        }
        
                
        
    }
    
    
}
