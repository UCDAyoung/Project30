//
//  ViewController.swift
//  PhotoScroll
//
//  Created by 박준영 on 2021/09/07.
//

import UIKit

class MainViewController: UIViewController {
    
    private let sectionInsets = UIEdgeInsets(top: 10, left: 5.0, bottom: 10.0, right: 5.0)
    @IBOutlet var collectionView : UICollectionView!
    var imageModel = ImageModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //sender로 처음 호출된 객체가 UICollectionViewCell가 nil이 아니고
        if let cell = sender as? UICollectionViewCell,
           // collectionView의 Cell의 indexPath가 nil 이 아니고
           let indexPath = collectionView.indexPath(for: cell),
           // segue의 도착지점이 DetailViewController가 아니ㄱ면
            let detailViewController = segue.destination as? DetailViewController {
            detailViewController.currentIndex = indexPath.row //와 이렇게 MainViewController에 있는 정보를 DetailViewController로  받는거구나?
            
        }
    }

}

extension MainViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageModel.name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detail", for: indexPath) as! CollectionViewCell
        cell.imageSetting(row: indexPath.row)
        return cell
    }
}
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CollectionViewCell.thumbnailSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
}

