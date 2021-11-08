//
//  NextViewController.swift
//  GoodAsOldPhones
//
//  Created by 박준영 on 2021/08/17.
//

import UIKit
class DetailViewController: UIViewController,UINavigationControllerDelegate {
    
    let assets = Assets()
    var indexOfRow : Int = 0
   
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var addButton : UIButton!
    @IBOutlet weak var backImage : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.layer.cornerRadius = CGFloat(10)
        
//        let backBtn = UIImage(named: "icon-about-email")
//        let leftItem = UIBarButtonItem(image: backBtn, style: .plain, target: self, action: nil)
//        navVC.navigationItem.leftBarButtonItem = leftItem
        
        titleLabel.text = assets.productsTitle[indexOfRow]
        backImage.image = UIImage(named : assets.backImage[indexOfRow])
        

    }

    
    private func configureAddToCartButton(){
        addButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    @objc func didTapButton(){
        print("didTapButton")
    }
    
    
    
}

