//
//  ViewController.swift
//  CollectionPrac
//
//  Created by 박준영 on 2021/09/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    var imageSet = ImageModel()
    
    let searchbar : UISearchController = {
        let searchBar = UISearchController()
        searchBar.searchBar.placeholder = "Search"
        return searchBar
    }()
    
  
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .green
        self.navigationItem.searchController = searchbar
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
}


extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "house_1")
        print(indexPath.row)
        
        
        return cell
    }
}


extension ViewController : UICollectionViewDelegateFlowLayout {
    //아이템 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size : CGSize
        size = CGSize(width: 80, height: 80)
        return size
    }

//    //아이템 바깥쪽 여백
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
//
//        let inset : UIEdgeInsets
//        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        return inset
//    }
   
    //가로 최소 간격 (inset이 정해진 상태에서는 priority가 밀릴 수 있음)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        let float : CGFloat = 10
        return float

    }

    //세로 최소 간격 (inset이 정해진 상태에서는 priority가 밀릴 수 있음)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        let float : CGFloat = 3
    
        return float
    }

    
    //헤더
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        return CGSize(width: 30, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
        return CGSize(width: 30, height: 30)
    }
//
}
