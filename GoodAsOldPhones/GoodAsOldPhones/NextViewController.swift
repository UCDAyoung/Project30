//
//  NextViewController.swift
//  GoodAsOldPhones
//
//  Created by 박준영 on 2021/08/17.
//

import UIKit
class NextViewController: UIViewController {
    
    let assets = Assets()
   
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var addToButton : UIButton!
    @IBOutlet weak var backImage : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToButton.setTitle("ADD TO CART", for: .normal)
        

    }
    func settings(indexPath : IndexPath){
        self.titleLabel.text = assets.productsTitle[indexPath.row]
        self.backImage.image = UIImage(named: assets.backImage[indexPath.row])
    
    }
        
    
    
    
    
}

