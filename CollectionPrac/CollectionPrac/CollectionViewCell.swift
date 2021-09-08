//
//  CollectionViewCell.swift
//  CollectionPrac
//
//  Created by 박준영 on 2021/09/06.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let imageModel = ImageModel()
    @IBOutlet weak var imageView : UIImageView!
    
    func settings(row : Int) {
        self.backgroundColor = .blue
        
    }
    
    override var isSelected: Bool {
        didSet{
            if isSelected {
                imageView.backgroundColor = .blue
            }else {
                imageView.backgroundColor = .yellow
            }
        }
    }
        
}
