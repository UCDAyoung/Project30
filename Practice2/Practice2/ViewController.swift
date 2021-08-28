//
//  ViewController.swift
//  Practice2
//
//  Created by 박준영 on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var presentButton: UIButton!
    @IBOutlet weak var navigationButton: UIButton!
    @IBOutlet weak var navigation2Button : UIButton!
    @IBOutlet weak var segueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapPresentButton() {
        let nextVC = self.storyboard?.instantiateViewController(identifier: "PresentViewController")
        present(nextVC!, animated: true, completion: nil)
        
    }
    @IBAction func didTapNavigateButton(){
        let rootVC = NavgationViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
    @IBAction func didTapNavigate2Button(){
        let nextVC = self.storyboard?.instantiateViewController(identifier: "Navigate2ViewCell")
        
        
    }

}

class PresentViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
   
}

class NavgationViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}

class SegueViewController : UIViewController {
    override func viewDidLoad() {
         
    }
}

