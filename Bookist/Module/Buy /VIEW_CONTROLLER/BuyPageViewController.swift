//
//  BuyPageViewcController.swift
//  Bookist
//
//  Created by Phincon on 30/03/23.
//

import UIKit
import SDWebImage

class BuyPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var model : BuyPageModel?
    var viewModel : BuyPageViewModel?
    
    private lazy var tableview : UITableView = {
            let table = UITableView()
            table.translatesAutoresizingMaskIntoConstraints = false
            table.backgroundColor = .clear
//            table.rowHeight = UITableView.automaticDimension
//            table.estimatedRowHeight = 300
       
        table.register(AboutBookTableViewCell.self, forCellReuseIdentifier: AboutBookTableViewCell.identifier)
            table.register(BookRatingTableViewCell.self, forCellReuseIdentifier: BookRatingTableViewCell.identifier)
            table.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
//            table.register(RatingsTableViewCellTableViewCell.self, forCellReuseIdentifier: RatingsTableViewCellTableViewCell.identifier)
            table.register(RateThisBookTableViewCell.self, forCellReuseIdentifier: RateThisBookTableViewCell.identifier)
            return table
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTable()
        bindApiData()
        tableview.register(UINib(nibName: "RatingsTableViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: RatingsTableViewCellTableViewCell.identifier)
        tableview.register(UINib(nibName: "BookSeriesTableViewCell", bundle: nil), forCellReuseIdentifier: BookSeriesTableViewCell.identifier)
        tableview.register(UINib(nibName: SimilarEbooksTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SimilarEbooksTableViewCell.identifier)
    }
    
    func bindApiData(){
        self.viewModel = BuyPageViewModel(urlSting: "http://localhost:3002/AboutThisBook", apiService: ApiServiceBuyPage())
        self.viewModel?.bindBuyPage = {buypageListModel in
            if let data = buypageListModel{
                self.model = data
            }
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        
        viewModel?.fetchBuyPage()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0, 1, 2, 3, 4, 5, 6:
            return 1
        default:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0, 1, 2, 3, 4:
            return UITableView.automaticDimension
        case 5:
            return 290
        case 6:
            return 250
        default:
            break;}
        return 55.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0, 1, 2, 3, 4:
            return UITableView.automaticDimension
        case 5:
            return 290
        case 6:
            return 270
        default:
            break;
    }
        return 230
    }
   

    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AboutBookTableViewCell.identifier, for: indexPath) as? AboutBookTableViewCell else{ return UITableViewCell()}
//            cell.setUpTableCell(bookData: model)
            print("dataa: ", model)

            guard let data = model else { return UITableViewCell() }
                cell.setUpTableCell(bookData: data)
             
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookRatingTableViewCell.identifier, for: indexPath) as? BookRatingTableViewCell else {return UITableViewCell()}
            
            guard let data = model?.bookDescription else {return UITableViewCell()}
            cell.setUpBookingTableCell(bookData: data)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as? DescriptionTableViewCell else {
                return UITableViewCell()}
            
            guard let data = model else {return UITableViewCell()}
            cell.setUpTableCell(bookData: data)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RatingsTableViewCellTableViewCell.identifier, for: indexPath) as? RatingsTableViewCellTableViewCell else {
                return UITableViewCell()
            }
            cell.ratingLabel.text =  "\(model?.bookDescription.rating ?? 0 )"
            cell.reviewsLabel.text = "(\(model?.bookDescription.reviews ?? 0)Reviews)"
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RateThisBookTableViewCell.identifier, for: indexPath) as? RateThisBookTableViewCell else{ return UITableViewCell()}
            
            cell.setUpTable()
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BookSeriesTableViewCell.identifier, for: indexPath) as? BookSeriesTableViewCell else{
                return UITableViewCell()
            }
           
            cell.setUpTableCell()
            cell.passingData = model
         return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SimilarEbooksTableViewCell.identifier, for: indexPath) as? SimilarEbooksTableViewCell else {return UITableViewCell()}
            cell.setUpTableCell()
            cell.passingData = model
            return cell
        default:
            break
        }
      return UITableViewCell()
    }
}
    private extension BuyPageViewController{
        func setUpTable(){
            tableview.dataSource = self
            tableview.delegate = self
            self.view.addSubview(tableview)
            
            NSLayoutConstraint.activate([tableview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                                         tableview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                                         tableview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                                         tableview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)])
       
        }
        
       

}
    
