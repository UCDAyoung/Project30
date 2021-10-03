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
//필요없어서 지움.    var indexPathRow : Int?
    var imageName : String?
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named:imageName! )
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.view.addGestureRecognizer(tap)
        //pinch 적용하기
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(doPinch(_:)))
        self.imageView.addGestureRecognizer(pinch)
        //imageView에 왜 안올라가져 ㅠㅠ
    }
    
    @objc func doPinch(_ pinch : UIPinchGestureRecognizer){
        imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
    }
    //performSegue이용 - > 다시 공부해야함
    @objc func didTap(_ tap : UITapGestureRecognizer) {
        performSegue(withIdentifier: "zoomed", sender: tap)
    }
    //sender를 통해 UIImage전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomedViewController = segue.destination as! ZoomedViewController
        zoomedViewController.imageName = imageName
//        zoomedViewController.imageName = sender
    }
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//       
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
