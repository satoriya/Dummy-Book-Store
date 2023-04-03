//
//  AccountViewController.swift
//  Bookist
//
//  Created by Phincon on 03/04/23.
//

import UIKit

enum AccountMenuSection: Int {
    case user
    case payment
    case menu1
    case menu2
    
    init(_ section: Int){
        switch section {
        case 0:
            self = .user
        case 1:
            self = .payment
        case 2:
            self = .menu1
        case 3:
            self = .menu2
        default:
            self = .user
        }
    }
}

class AccountViewController: UIViewController {
    
    var accountTableView: UITableView!
    var accountViewModel: AccountViewModel?
    var modelAccount: Account?
    
    var logoImage: UIImageView = {
        var logoImg = UIImageView()
        logoImg.image = UIImage(systemName: "text.book.closed.fill")
        logoImg.tintColor = .orange
        logoImg.widthAnchor.constraint(equalToConstant: 25).isActive = true
        logoImg.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return logoImg
    }()
    
    var titleLabel: UILabel = {
       var titleLbl = UILabel()
        titleLbl.text = "Account"
        titleLbl.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return titleLbl
    }()
    
    var menuButtonImage: UIImageView = {
        var menuBtnImage = UIImageView()
        menuBtnImage.image = UIImage(systemName: "circle.grid.3x3.circle")
        menuBtnImage.tintColor = .orange
        menuBtnImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        menuBtnImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return menuBtnImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccountTableView()
        bindAPIDatas()
        setNavigationBar()
    }
    
    func setupAccountTableView() {
        accountTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        accountTableView.separatorStyle = .none
        accountTableView.dataSource = self
        accountTableView.delegate = self
        accountTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
        accountTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: MenuTableViewCell.identifier)
        
        view.addSubview(accountTableView)
        accountTableView.translatesAutoresizingMaskIntoConstraints = true
        
        if #available(iOS 15.0, *) {
            accountTableView.sectionHeaderTopPadding = 0
        }
        
        NSLayoutConstraint.activate([
            accountTableView.topAnchor.constraint(equalTo: view.topAnchor),
            accountTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            accountTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            accountTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func bindAPIDatas(){
        self.accountViewModel = AccountViewModel(urlString: "http://localhost:3002/account", apiService: ApiService())
        
        self.accountViewModel?.bindAccountData = { accountDatas in
            if let datas = accountDatas {
                self.modelAccount = datas
            }
            print("reload data")
            DispatchQueue.main.async {
                self.accountTableView.reloadData()
            }
        }
    }
    
    func setNavigationBar(){
        let leftStackView = UIStackView(arrangedSubviews: [logoImage, titleLabel])
        leftStackView.spacing = 10
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftStackView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: menuButtonImage)
        
        self.navigationItem.titleView = UIView(frame: .zero)
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let accountModel = modelAccount else { return 0 }
        switch AccountMenuSection(section){
        case .user:
            return 1
        case .menu1, .payment, .menu2:
            return accountModel.data.items[section-1].item.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch AccountMenuSection(indexPath.section){
        case .user:
            guard let cell = accountTableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
            cell.userNameLabel.text = modelAccount?.userName ?? ""
            cell.emailLabel.text = modelAccount?.email
            cell.profileImage.loadFrom(URLAddress: modelAccount?.userImage ?? "")
            return cell
        case .menu2, .menu1, .payment:
            guard let menuData = modelAccount?.data.items[indexPath.section - 1],
                let cell = accountTableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
            
            cell.setDataMenu(data: menuData.item[indexPath.row])
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let count = modelAccount?.data.items.count ?? 0
        return count == 0 ? 0 : count + 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch AccountMenuSection(section) {
        case .user:
            return UIView(frame: .zero)
        case .payment, .menu1, .menu2:
            let headerView = UITableViewHeaderFooterView()
            
            let sectionSeparator = UIView()
            sectionSeparator.backgroundColor = UIColor.systemGray5
            sectionSeparator.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(sectionSeparator)
            
            NSLayoutConstraint.activate([
                
                headerView.heightAnchor.constraint(equalToConstant: 1),
                sectionSeparator.leftAnchor.constraint(equalTo: headerView.leftAnchor),
                sectionSeparator.rightAnchor.constraint(equalTo: headerView.rightAnchor),
                sectionSeparator.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
                sectionSeparator.topAnchor.constraint(equalTo: headerView.topAnchor)
            ])
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch AccountMenuSection(section) {
        case .user:
            return .zero
        case .payment, .menu1, .menu2:
            return 1
        }
    }

}
