//
//  BuyPageViewcController.swift
//  Bookist
//
//  Created by Phincon on 30/03/23.
//

import UIKit

class BuyPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        default:
            break
        }
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AboutBookTableViewCell.identifier, for: indexPath) as? AboutBookTableViewCell else{ return UITableViewCell()}
            cell.setUpTableCell()
        
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookRatingTableViewCell.identifier, for: indexPath) as? BookRatingTableViewCell else {return UITableViewCell()}
            cell.setUpBookingTableCell()
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as? DescriptionTableViewCell else {
                return UITableViewCell()
            }
            cell.setUpTableCell()
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RatingsTableViewCell.identifier, for: indexPath) as? RatingsTableViewCell else {
                return UITableViewCell()
            }
            cell.setUpTableCell()
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RateThisBookTableViewCell.identifier, for: indexPath) as? RateThisBookTableViewCell else{ return UITableViewCell()}
            cell.setUpTable()
            return cell
        default:
            break
        }
      return UITableViewCell()
    }
    
    
    
    private lazy var tableview : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 45
        table.separatorStyle = .none
        table.register(AboutBookTableViewCell.self, forCellReuseIdentifier: AboutBookTableViewCell.identifier)
        table.register(BookRatingTableViewCell.self, forCellReuseIdentifier: BookRatingTableViewCell.identifier)
        table.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        table.register(RatingsTableViewCell.self, forCellReuseIdentifier: RatingsTableViewCell.identifier)
        table.register(RateThisBookTableViewCell.self, forCellReuseIdentifier: RateThisBookTableViewCell.identifier)
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTable()
    }
}
    private extension BuyPageViewController{
        func setUpTable(){
            tableview.dataSource = self
            self.view.addSubview(tableview)
            
            NSLayoutConstraint.activate([tableview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                                         tableview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                                         tableview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                                         tableview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)])
       
        }

}
    
