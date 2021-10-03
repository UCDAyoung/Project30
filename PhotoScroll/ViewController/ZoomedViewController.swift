//
//  ZoomedViewController.swift
//  PhotoScroll
//
//  Created by 박준영 on 2021/09/10.
//

import UIKit

class ZoomedViewController: UIViewController {

    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var imageView : UIImageView!
    var imageName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName!)
        // Do any additional setup after loading the view.
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
