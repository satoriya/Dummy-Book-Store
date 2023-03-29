//
//  HomeViewController.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 29/03/23.
//

import UIKit

enum Sections: Int {
    case top = 0, genres, recommended, purchased, wishlist
}

class HomeViewController: UIViewController {

//    let title = [""]
    
    private lazy var homeTable: UITableView = {
        let tb = UITableView(frame: .zero, style: .grouped)
        tb.translatesAutoresizingMaskIntoConstraints = false
        
        tb.register(HeaderTableCell.self, forHeaderFooterViewReuseIdentifier: HeaderTableCell.identifier)
        tb.register(BookTableCell.self, forCellReuseIdentifier: BookTableCell.identifier)
        
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
    }

    func setupTable() {
        view.addSubview(homeTable)
        
        NSLayoutConstraint.activate([
            homeTable.topAnchor.constraint(equalTo: view.topAnchor),
            homeTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        homeTable.delegate = self
        homeTable.dataSource = self
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
        let header = homeTable.dequeueReusableHeaderFooterView(withIdentifier: HeaderTableCell.identifier) as? HeaderTableCell
        header?.addSubviews()
        header?.configure(title: "Explore By Genre")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sections = Sections(rawValue: section)
        
        switch sections {
        case .genres:
            return "Explore By Genre"
        case .recommended:
            return "Recommended For You"
        case .purchased:
            return "On Your Purchased"
        case .wishlist:
            return "On Your Wishlist"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = Sections(rawValue: indexPath.section)
        
        switch sections {
        case .top:
            guard let topCell = homeTable.dequeueReusableCell(withIdentifier: BookTableCell.identifier, for: indexPath) as? BookTableCell else { return UITableViewCell() }
            topCell.textLabel?.text = "test"
            return topCell
        default:
            return UITableViewCell()
        }
        
                
        
    }
    
    
}
