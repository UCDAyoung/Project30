//
//  NextViewController.swift
//  CoreDataIsEasy
//
//  Created by 박준영 on 2021/12/05.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = memo[0].contents
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
