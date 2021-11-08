//
//  ViewController.swift
//  practice
//
//  Created by 박준영 on 10/30/21.
//

import UIKit

class ViewController: UIViewController {

    var view2 = UIView(frame: CGRect(x: 30, y: 30, width: 200, height: 200))
    var view3 = UIView(frame: CGRect(x: 30, y: 30, width: 50, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view2.backgroundColor = .red
        view3.backgroundColor = .blue
        view.addSubview(view2)
        view2.addSubview(view3)
        view2.bounds.origin = CGPoint(x: 30,y: 30)
        
//        view2.frame.origin = CGPoint(x: 60, y: 60)
        
        
    }


}

