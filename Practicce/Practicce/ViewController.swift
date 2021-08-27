//
//  ViewController.swift
//  Practicce
//
//  Created by 박준영 on 2021/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input : UITextField!
    @IBOutlet weak var button : UIButton!
    var temp : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        //        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @IBAction func tapButton(_ sender : UIButton){
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondView") as? SecondViewController else { return }
        present(nextVC, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondViewController {
            let nextVC = segue.destination as? SecondViewController
            nextVC?.receivedText = input.text
        }
    }


}

class SecondViewController : UIViewController {
    
    private let label = UILabel()
    private let button = UIButton()
    var receivedText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        
        button.setTitle("button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        view.addSubview(button)
        view.addSubview(label)
        
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        label.frame = CGRect(x : 100, y: 300, width :300, height: 100)
        label.tintColor = .black
        label.backgroundColor = .white
        
        
        
        button.addTarget(self, action: #selector(tapDimissButton(_:)), for: .touchUpInside)
        label.text = receivedText

    }
    
    @objc func tapDimissButton(_ sender : UIButton) {
        print("hello")
        self.navigationController?.popViewController(animated: true)
    }
    
        
}

