//
//  DetailViewController.swift
//  PhotoScroll
//
//  Created by 박준영 on 2021/09/07.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageModel = ImageModel()
//실패    var currentImage : UIImage!
    var indexPathRow : Int = 0
    @IBOutlet weak var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named:imageModel.name[indexPathRow] )
        
        
        //pinch 적용하기
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch : UIPinchGestureRecognizer){
        imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
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
