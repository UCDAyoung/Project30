//
//  firstView.swift
//  GoodAsOldPhones
//
//  Created by 박준영 on 2021/08/17.
//

import UIKit

class ProductsCell: UITableViewCell {
        
    @IBOutlet weak var productsImg: UIImageView!
    @IBOutlet weak var productsLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented") //--> 오류발생하여 아래로 바꿨는데, 이유가 와닿지 않습니다 ㅠ
        super.init(coder: coder)
    }
    
//    @objc func handleTapGesture(recognizer : UITapGestureRecognizer){
//        print("Touch review")
//    }
}

 
