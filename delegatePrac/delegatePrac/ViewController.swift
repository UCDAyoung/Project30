//
//  ViewController.swift
//  delegatePrac
//
//  Created by 박준영 on 10/8/21.
//

import UIKit

protocol bitting {
    
    func bit()
    func base()
    func drum()
}

class BitMaker : bitting {
    
    var delegate  : bitting?
    
    func bit() {
        for _ in 1...10{
            print("bit")
        }
    }
    
    func base() {
        for _ in 1...3{
            print("base")
        }
    }
    
    func drum() {
        for _ in 1...7{
            print("drum")
        }
        
    }
    
    
}

class ViewController: UIViewController {
    
    var bitMaker : BitMaker?
    
    @IBOutlet var button : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func click(_ sender : UIButton){
        bitMaker?.delegate = self
    }


}

extension ViewController : bitting {
    
    func bit() {
        for _ in 1...10{
            print("BIT")
        }
    }

    func base() {
        for _ in 1...3{
            print("BASE")
        }
    }

    func drum() {
        for _ in 1...7{
            print("DRUM")
        }

    }

    
}

