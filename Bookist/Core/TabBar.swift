//
//  TabBar.swift
//  Bookist
//
//  Created by Phincon on 27/03/23.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupVCs()
        self.view.backgroundColor = .white
    }
    
    func setupVCs() {
           viewControllers = [
               createNavController(for: ViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "magnifyingglass")!),
               createNavController(for: ViewController(), title: NSLocalizedString("Discover", comment: ""), image: UIImage(systemName: "house")!),
               createNavController(for: WishlistViewController(), title: NSLocalizedString("Wishlist", comment: ""), image: UIImage(systemName: "person")!),
               createNavController(for: ViewController(), title: NSLocalizedString("Purchased", comment: ""), image: UIImage(systemName: "person")!),
               createNavController(for: ViewController(), title: NSLocalizedString("Account", comment: ""), image: UIImage(systemName: "person")!)
           ]
       }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.title = title
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = true
           rootViewController.navigationItem.title = title
           return navController
       }

}
