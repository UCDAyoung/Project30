//
//  CollectionViewCell.swift
//  PhotoScroll
//
//  Created by 박준영 on 2021/09/07.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    static let reuseIdentifier = "cell"
    private let imageModel = ImageModel()
    
        
    
    
    
    func imageSetting(row : Int){
        imageView.image = UIImage(named: imageModel.name[row])
        
    }

    
 
}

//extension UIImage {
//  func thumbnailOfSize(_ newSize: CGSize) -> UIImage? {
//    let renderer = UIGraphicsImageRenderer(size: newSize)
//    let thumbnail = renderer.image { _ in
//      draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
//    }
//    return thumbnail
//  }
//}
