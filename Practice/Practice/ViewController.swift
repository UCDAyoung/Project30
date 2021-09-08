//
//  ViewController.swift
//  Practice
//
//  Created by 박준영 on 2021/08/31.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UICollectionViewDelegate {
    
    
    let searchBarController = UISearchController()
    lazy var button = UIBarButtonItem(image: UIImage(named: "fb_town_hall"), style: .plain, target: self, action: #selector(touchSearchBar(_:)))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.searchController = searchBarController
        self.navigationItem.rightBarButtonItem = button
        self.navigationItem.title = "example"
        searchBarController.searchBar.placeholder = "Search"
        searchBarController.searchBar.backgroundColor = .red
        searchBarController.searchBar.tintColor = .black
        searchBarController.searchBar.scopeButtonTitles = [
        "안녕","나는","준영","이야"]
        searchBarController.searchBar.showsScopeBar = true
        
        
    }
    
    @objc func touchSearchBar(_ sender : Any){
        
            
            let items = ["heart"]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
         
            self.present(ac, animated: true)
        
    }

}

class SecondViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

