//
//  NextViewController.swift
//  GoodAsOldPhones
//
//  Created by 박준영 on 2021/08/17.
//

import UIKit
class DetailViewController: UIViewController,UINavigationControllerDelegate {
    
    let assets = Assets()
   
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var addToButton : UIButton!
    @IBOutlet weak var backImage : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToButton.setTitle("ADD TO CART", for: .normal)
        
//        let backBtn = UIImage(named: "icon-about-email")
//        let leftItem = UIBarButtonItem(image: backBtn, style: .plain, target: self, action: nil)
//        navVC.navigationItem.leftBarButtonItem = leftItem
    
        
        

    }

    
    func settings(indexPath : IndexPath){
        self.titleLabel.text = assets.productsTitle[indexPath.row]
        self.backImage.image = UIImage(named: assets.backImage[indexPath.row])
    
    }
    private func configureTitleLabel(){
        titleLabel.fon
    }
    
    private func configureAddToCartButton(){
        addToButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    @objc func didTapButton(){
        print("didTapButton")
    }
    
    
    
}

