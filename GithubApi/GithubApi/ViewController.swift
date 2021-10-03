//
//  ViewController.swift
//  GithubApi
//
//  Created by 박준영 on 10/1/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var textField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    
}


