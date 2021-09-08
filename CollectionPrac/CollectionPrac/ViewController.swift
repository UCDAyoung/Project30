//
//  ViewController.swift
//  CollectionPrac
//
//  Created by 박준영 on 2021/09/06.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView : UICollectionView!
    var filteredPicture : String
    
    let searchbar : UISearchController = {
        let searchBar = UISearchController()
        searchBar.searchBar.placeholder = "Search"
        return searchBar
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.settings(row: indexPath.row)
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .green
        self.navigationItem.searchController = searchbar
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
    }
    
    private func filter(_ searchKeyword : String){
        self.filteredPicture = self.filter { (picture : Picture) -> Bool in
             
            
        }
    }
    
}



struct Picture : Codable {
    var name : String
}
