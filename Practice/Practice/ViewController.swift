//
//  ViewController.swift
//  Practice
//
//  Created by 박준영 on 2021/08/22.
//

import UIKit

class ViewController: UIViewController {

    let subview = UIView()
    let subview2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(subview)
        view.addSubview(subview2)
        subview.backgroundColor = .white
        subview.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        print("viewDidLoad)")
    }
    
    
    
    


}

