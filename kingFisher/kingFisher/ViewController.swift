//
//  ViewController.swift
//  kingFisher
//
//  Created by 박준영 on 11/4/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .systemGray
    }
    
    
    @IBAction func didTapButton(_ sender : UIButton){
        let url = URL(string: "https://www.ryanseslow.com/wp-content/uploads/2021/10/Meta-NYC.gif")
        imageView.kf.setImage(with: url)
    }
    
}

