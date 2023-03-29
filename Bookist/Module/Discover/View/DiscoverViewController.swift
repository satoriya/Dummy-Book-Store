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

class DiscoverViewController: UIViewController {
    
    private lazy var discoverTableView: UITableView = {
       let discoverTableView = UITableView()
        discoverTableView.translatesAutoresizingMaskIntoConstraints = false
        return discoverTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    private func setupTableView() {
        discoverTableView.delegate = self
        discoverTableView.dataSource = self
    }
}

extension DiscoverViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch DiscoverSection(section) {
        case .topCharts:
            return 1
        case .topSelling:
            return 1
        case .topFree:
            return 1
        case .topNewRelease:
            return 1
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch DiscoverSection(indexPath.section) {
        case .topCharts:
            return UITableViewCell()
        case .topSelling:
            return UITableViewCell()
        case .topFree:
            return UITableViewCell()
        case .topNewRelease:
            return UITableViewCell()
        case .none:
            return UITableViewCell()
        }
    }
}
