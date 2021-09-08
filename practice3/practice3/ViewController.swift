//
//  ViewController.swift
//  practice3
//
//  Created by 박준영 on 2021/09/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button : UIButton!
    @IBOutlet weak var label :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       
    }


    @IBAction func randomQutoe(_ sender : Any){
        let url = URL(string : "https://api.kanye.rest/")!
        let task = URLSession.shared.dataTask(with: url) { (data : Data?, response : URLResponse?, error:Error?) in
            
            if let error = error {
                print("Error",error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else{
                print("not the right response")
                return
            }
            guard(200...299).contains(httpResponse.statusCode) else {
                print("Error")
                return
            }
            guard let data = data else {
                print("bad data")
                return
            }
            
            
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String : String]
            DispatchQueue.main.async {
                self.label.text = json["quote"]
            }
            
        }
        task.resume()
    }
}

