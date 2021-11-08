//
//  ViewController.swift
//  animationPrac
//
//  Created by 박준영 on 10/28/21.
//

import UIKit

class ViewController: UIViewController {

    var grassImageView : UIImageView = {
        let grassImageView = UIImageView()
        grassImageView.translatesAutoresizingMaskIntoConstraints = false
        grassImageView.image = UIImage(named: "grass")
        return grassImageView
    }()
    @IBOutlet weak var bellImage: UIImageView!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var ringButton : UIButton!
    @IBOutlet weak var cancelButton : UIButton!
    @IBOutlet weak var stackView : UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageView 우선순위 맨 뒤로
        self.view.insertSubview(grassImageView, at: 0)
        //conrenrRadius 조정
        self.ringButton.layer.cornerRadius = CGFloat(10)
        self.cancelButton.layer.cornerRadius = CGFloat(10)
        self.catImage.layer.cornerRadius = CGFloat(14)
        //배경 constraint
        NSLayoutConstraint.activate([
            grassImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            grassImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            grassImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            grassImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            grassImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            grassImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
        
        
        
    }

    @IBAction func ringingButton(_ sender : UIButton){
//
        func back( rotate : CGFloat){
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut ,animations : {
                self.bellImage.transform = CGAffineTransform(rotationAngle: 20 - rotate)
            }, completion: nil )
                
        }
        func start( rotate : CGFloat){
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut ,animations : {
                self.bellImage.transform = CGAffineTransform(rotationAngle:-20 + rotate)
            }, completion: { _ in
                back(rotate: 10)
                
            } )
        }
        UIView.animate(withDuration: 2, delay: 0.5, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: [.curveEaseOut,.repeat,], animations: {

            self.catImage.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -220).isActive = true
            self.view.layoutIfNeeded()

        }, completion:nil)
        
        start(rotate: 10)
        
        
    }


}

