//
//  ViewController.swift
//  FlickerSearch
//
//  Created by 박준영 on 2021/09/22.
//

import UIKit

class MainViewController: UIViewController, UISearchControllerDelegate{
    
    var searches : [FlickrSearchResults] = []
    private let flickr = Flickr()
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    
    var shareButton : UIBarButtonItem = {
        let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(didTapShareButton))
        return shareButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()
        setUpRegister()
        
//        setUpNavigationSettings()
        
    }
    func setUpDelegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    func setUpRegister(){
        collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.reuseIdentifier)
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.reuseIdentifier)
    }
   
    
    @objc func didTapShareButton(){
        print("hi")
    }
    


}


extension MainViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    //헤더 추가
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.reuseIdentifier, for: indexPath) as! CollectionHeaderView
            return headerView
           
        default:
            assert(false, "Invalid element type")
        }
    }
    //섹션 수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searches.count
    }
    //아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches[section].searchResults.count
    }
    //셀 아이템 정보
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCollectionViewCell
        let flickrPhoto = photo(for: indexPath)
        cell.backgroundColor = .white
//        cell.imageView2.image = 
        
//        cell.imageView.image = flickrPhoto.thumbnail
        
        return cell
    }
    
    
}
// MARK: - CollectionView Delegate
private extension MainViewController {
  func photo(for indexPath: IndexPath) -> FlickrPhoto {
    return searches[indexPath.section].searchResults[indexPath.row]
  }
}

extension MainViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 20, height: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: 30, height: 30)
    }
}
// MARK: - Text Field Delegate
extension MainViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard
      let text = textField.text,
      !text.isEmpty
    else { return true }

    // 1
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    textField.addSubview(activityIndicator)
    activityIndicator.frame = textField.bounds
    activityIndicator.startAnimating()

    flickr.searchFlickr(for: text) { searchResults in
      DispatchQueue.main.async {
        activityIndicator.removeFromSuperview()

        switch searchResults {
        case .failure(let error) :
          // 2
          print("Error Searching: \(error)")
        case .success(let results):
          // 3
          print("""
            Found \(results.searchResults.count) \
            matching \(results.searchTerm)
            """)
          self.searches.insert(results, at: 0)
          // 4
          self.collectionView?.reloadData()
        }
      }
    }

    textField.text = nil
    textField.resignFirstResponder()
    return true
  }
}

//searchBar 생성 #1. searchBar 2. serachController()
//searchContrller 사용할 경우

/*
extension MainViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        flickr.searchFlickr(for: text, completion: <#T##(Result<FlickrSearchResults, Error>) -> Void#>)
        

        
    }
    
    func setUpNavigationSettings(){
        let searchBar = UISearchController(searchResultsController: nil)
        searchBar.searchResultsUpdater = self
        searchBar.hidesNavigationBarDuringPresentation = false
        navigationItem.rightBarButtonItem = shareButton
        navigationItem.title = "FlickerSearch"
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}
*/

