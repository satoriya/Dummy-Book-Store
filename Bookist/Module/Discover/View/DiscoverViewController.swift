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
        setupViewModel()
        setupTableView()
    }
    
    private func setupViewModel() {
        discoverViewModel = DiscoverViewModel()
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
        return discoverViewModel?.discoverHeaders.count ?? 0
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
        
        switch DiscoverSectionCell(rawValue: indexPath.row) {
        case .header:
            guard let discoverHeader = discoverViewModel?.discoverHeaders[indexPath.section],
                let headerCell = tableView.dequeueReusableCell(withIdentifier: DiscoverHeaderTableViewCell.identifier, for: indexPath) as? DiscoverHeaderTableViewCell
            else { return UITableViewCell() }
            
            headerCell.delegate = self
            headerCell.setupCell(title: discoverHeader.sectionTitle, type: discoverHeader.sectionType)
            
            return headerCell
            
            
        case .bookList:
            guard let discoverBookListCell = tableView.dequeueReusableCell(withIdentifier: DiscoverBookListTableViewCell.identifier, for: indexPath) as? DiscoverBookListTableViewCell
            else { return UITableViewCell() }
            
            discoverBookListCell.setupCell()
            
            return discoverBookListCell
            
            
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension DiscoverViewController: DiscoverHeaderDelegate {
    func handleHeaderIconSelected(type: DiscoverSection) {
        print("go to show all \(type)")
    }
}
