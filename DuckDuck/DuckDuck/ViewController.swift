//
//  ViewController.swift
//  DuckDuck
//
//  Created by 박준영 on 10/8/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var duckImage : UIImageView!
   
    var duck : Duck = Duck(imageURL: "https://random-d.uk/api/random")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(_ sender: UIButton){
        requestDucks(completion: <#T##(Duck?) -> Void#>)
        requestDucks { duck in
            if let url: URL = URL(string: "\(duck?.imageURL)"){
                let imageData = try! Data(contentsOf: url)
                self.duckImage?.image = UIImage(data: imageData)
            }
        
    }
        
        
            
}

//
//struct Point: CustomDebugStringConvertible {
//    let x: Int, y: Int
//
//    var debugDescription: String {
//        return "(\(x), \(y))"
//    }
//}
//
//let p = Point(x: 21, y: 30)
//let s = String(reflecting: p)
//print(s)
