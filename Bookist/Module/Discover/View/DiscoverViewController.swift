//
//  DiscoverViewController.swift
//  Bookist
//
//  Created by Teguh Wibowo Wijaya on 29/03/23.
//

import UIKit

enum DiscoverSection: Int {
    case topCharts
    case topSelling
    case topFree
    case topNewRelease
    case none
    
    init(_ section: Int) {
        switch section {
        case 0:
            self = .topCharts
        case 1:
            self = .topSelling
        case 2:
            self = .topFree
        case 3:
            self = .topNewRelease
        default:
            self = .none
        }
    }
}

enum DiscoverSectionCell: Int {
    case header
    case bookList
}

class DiscoverViewController: UIViewController {
    
    private var discoverViewModel: DiscoverViewModel?
    
    private lazy var discoverTableView: UITableView = {
       let discoverTableView = UITableView()
        discoverTableView.translatesAutoresizingMaskIntoConstraints = false
        return discoverTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavBar()
        setupViewModel()
        setupTableView()
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Discover"
        self.navigationItem.titleView = UIView(frame: .zero)
        
        let leftBarItem = DiscoverLeftBarItem()
        leftBarItem.setupBarItem()
        
        let rightBarItem = DiscoverRightBarButtonItem()
        rightBarItem.delegate = self
        rightBarItem.setupBarButtonItem()
        
        navigationItem.setLeftBarButton(leftBarItem, animated: true)
        navigationItem.setRightBarButton(rightBarItem, animated: true)
    }
    
    private func setupViewModel() {
        discoverViewModel = DiscoverViewModel()
        discoverViewModel?.delegate = self
        discoverViewModel?.getDiscoverData()
    }
    
    private func setupTableView() {
        addSubviews()
        setComponentsConstraints()
        
        discoverTableView.delegate = self
        discoverTableView.dataSource = self
        discoverTableView.separatorStyle = .none
        
        discoverTableView.register(DiscoverHeaderTableViewCell.self, forCellReuseIdentifier: DiscoverHeaderTableViewCell.identifier)
        
        discoverTableView.register(DiscoverBookListTableViewCell.self, forCellReuseIdentifier: DiscoverBookListTableViewCell.identifier)
    }
    
    private func addSubviews() {
        self.view.addSubview(discoverTableView)
    }
    
    private func setComponentsConstraints() {
        NSLayoutConstraint.activate([
            discoverTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            discoverTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            discoverTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            discoverTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return discoverViewModel?.discoverData?.data.items.count ?? 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch DiscoverSection(section) {
        case .none:
            return 0
        default:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let discoverSection = discoverViewModel?.discoverData
        
        switch DiscoverSectionCell(rawValue: indexPath.row) {
        case .header:
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: DiscoverHeaderTableViewCell.identifier, for: indexPath) as? DiscoverHeaderTableViewCell
            else { return UITableViewCell() }
            
            headerCell.delegate = self
            
            let headerTitle = discoverSection?.data.items[indexPath.section].category
            headerCell.setupCell(
                title: headerTitle,
                cellIndex: indexPath.section,
                isLoading: discoverViewModel?.isLoading ?? true
            )
            
            return headerCell
            
            
        case .bookList:
            guard let discoverBookListCell = tableView.dequeueReusableCell(withIdentifier: DiscoverBookListTableViewCell.identifier, for: indexPath) as? DiscoverBookListTableViewCell
            else { return UITableViewCell() }
            
            let discoverSectionData = discoverSection?.data.items[indexPath.section].data
            
            discoverBookListCell.setupCell(
                discoverBooks: discoverSectionData,
                showLimit: discoverSection?.showingCount,
                isLoading: discoverViewModel?.isLoading ?? true
            )
            
            return discoverBookListCell
            
            
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension DiscoverViewController: DiscoverViewModelDelegate {
    func handleGetDiscoverDataCompleted() {
        if let errorMessage = discoverViewModel?.errorMessage {
            print(errorMessage)
            
        } else {
            DispatchQueue.main.async {
                self.discoverTableView.reloadData()
            }
        }
    }
}

extension DiscoverViewController: DiscoverHeaderDelegate {
    func handleHeaderIconSelected(type: String) {
        print("go to show all \(type)")
    }
}

extension DiscoverViewController: DiscoverRightBarButtonItemDelegate {
    func handleSearchButtonSelected() {
        print("Search Bar Button Selected")
    }
}
