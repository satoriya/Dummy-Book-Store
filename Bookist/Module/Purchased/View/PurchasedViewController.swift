//
//  PurchasedViewController.swift
//  Bookist
//
//  Created by Farhan Permana on 30/03/23.
//

import UIKit

class PurchasedViewController: UIViewController {
    
    var purchasedViewModel: PurchasedViewModel?
    
    private var listItems: PurchasedModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTable()
        configureNavBar()
        setupApi()
    }
    
    private func registerTable() {
        tableView.register(UINib(nibName: ItemTableCell.identifier, bundle: nil), forCellReuseIdentifier: ItemTableCell.identifier)
        
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.tintColor = .label
        navigationItem.title = nil
        navigationController?.navigationBar.prefersLargeTitles = false
        
        // navbar items
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "line.horizontal.3"),
                style: .plain,
                target: self,
                action: nil
            ),
            UIBarButtonItem(
                image: UIImage(systemName: "magnifyingglass"),
                style: .plain,
                target: self,
                action: nil
            )
        ]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "book"), style: .plain, target: self, action: nil
        )
        
        let label = UILabel()
        label.textColor = label.tintColor
        // label text from pagetitle
        label.text = listItems?.pageTitle ?? "null"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        self.navigationItem.titleView = label
        // left align the title
        label.translatesAutoresizingMaskIntoConstraints = false
        let offset = UIOffset(horizontal: -CGFloat.greatestFiniteMagnitude, vertical: 0)
        navigationController?.navigationBar.standardAppearance.titlePositionAdjustment = offset
        navigationController?.navigationBar.scrollEdgeAppearance?.titlePositionAdjustment = offset
        navigationController?.navigationBar.compactAppearance?.titlePositionAdjustment = offset
    }
    
    func setupApi(apiUrl: String = "http://localhost:3002/purchased") {
        self.purchasedViewModel = PurchasedViewModel(urlString: apiUrl, apiService: PurchasedApiService())
        self.purchasedViewModel?.bindListData = {
            listModel in
            if let listData = listModel {
                self.listItems = listData
                print("bind")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension PurchasedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableCell.identifier, for: indexPath) as? ItemTableCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
}

