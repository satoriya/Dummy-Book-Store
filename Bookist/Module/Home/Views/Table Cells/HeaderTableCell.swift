//
//  HeaderTableCell.swift
//  Bookist
//
//  Created by Adlan Nourindiaz on 29/03/23.
//

import UIKit

class HeaderTableCell: UITableViewHeaderFooterView {

    static let identifier = "HeaderTableCell"
    
//    @IBOutlet weak var headerTitle: UILabel! {
//        didSet {
//            headerTitle.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        }
//    }
//
//    @IBOutlet weak var viewAllButton: UIButton! {
//        didSet {
//            viewAllButton.tintColor = UIColor(named: "styleColor")
//        }
//    }
    
    private lazy var headerTitle: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return lb
    }()
    
    private lazy var viewAllButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 25))
        bt.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.tintColor = UIColor(named: "styleColor")
        return bt
    }()
    
    func addSubviews() {
        self.contentView.addSubview(headerTitle)
        self.contentView.addSubview(viewAllButton)
        
        setupHeaderTitle()
        setupViewAllButton()
    }
    
    func setupHeaderTitle() {
        NSLayoutConstraint.activate([
            headerTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            headerTitle.trailingAnchor.constraint(equalTo: viewAllButton.leadingAnchor, constant: 10)
        ])
    }
    
    func setupViewAllButton() {
        NSLayoutConstraint.activate([
            viewAllButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            viewAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(title: String) {
        headerTitle.text = title
    }
}
