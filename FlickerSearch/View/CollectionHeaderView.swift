//
//  CollectionHeaderViewCell.swift
//  FlickerSearch
//
//  Created by 박준영 on 2021/09/24.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "HeaderCell"
    @IBOutlet weak var label : UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray
//        imageView.image = UIImage(systemName: "square.and.arrow.up.fill")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
