//
//  NextViewController.swift
//  GoodAsOldPhones
//
//  Created by 박준영 on 2021/08/17.
//

import UIKit

class NextViewController: UIViewController {

    let imgList : [String] = [
        "phone-fullscreen1",
        "phone-fullscreen2",
        "phone-fullscreen3",
        "phone-fullscreen4"
    ]

    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var titleLabel: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //어떻게 index를 전달해서 받을 수 있지??
        
    }
    
    
    
    
}

