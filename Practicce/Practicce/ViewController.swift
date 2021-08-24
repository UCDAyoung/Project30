//
//  ViewController.swift
//  Practicce
//
//  Created by 박준영 on 2021/08/24.
//

import UIKit

class ViewController: UIViewController {

    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        button.setTitle("button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton(){
        
        let rootVC = SecondViewController() //root
        rootVC.title = "welcome"        //root
        let navVC = UINavigationController(rootViewController: rootVC)//rootVC가 root인 navigationController navVC
        
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
        
    }


}

class SecondViewController : UIViewController {
    
    private let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        
        button.setTitle("button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "dismiss", style: .plain, target: self, action: #selector(dismissSelf))

    }
    
    @objc private func tapButton(){
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.title = "hi"
        present(vc, animated: true, completion: nil)
    }
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
}

