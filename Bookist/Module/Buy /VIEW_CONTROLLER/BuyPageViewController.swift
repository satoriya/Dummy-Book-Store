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
        default:
            break
        }
        return 2
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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
//            cell.layer.borderColor = UIColor.green.cgColor
//            cell.layer.borderWidth = 1
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
    
