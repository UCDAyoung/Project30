//
//  ViewController.swift
//  LedPrac
//
//  Created by 박준영 on 10/22/21.
//

import UIKit


class ViewController: UIViewController,LEDBoardSettingDelegate{
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
    }
    func setting(){
        self.label.textColor = .yellow
        self.navigationController?.navigationBar.tintColor = .yellow
        self.navigationController?.navigationBar.backgroundColor = .black
        self.label.shadowColor = .white
        self.view.backgroundColor = .black
    }
    
    override func prepare(for segue:  UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        nextVC.delegate = self
    }
    
    func changeLEDSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.label.text = text
        }
        self.label.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }

}
