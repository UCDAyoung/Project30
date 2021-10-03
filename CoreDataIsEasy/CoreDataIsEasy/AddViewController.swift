//
//  AddViewController.swift
//  CoreDataIsEasy
//
//  Created by 박준영 on 9/30/21.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var categoryTF: UITextField!
    @IBOutlet weak var contentsTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        if let category = categoryTF.text,
           let contents = contentsTF.text {
            let memo = Memo(context: DBManager.shared.context) //??
            memo.category = category
            memo.contents = contents
            
            DBManager.shared.saveContext()
            
            
        }
    }
    
}
