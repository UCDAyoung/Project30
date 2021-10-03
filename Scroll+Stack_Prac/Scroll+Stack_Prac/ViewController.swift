//
//  ViewController.swift
//  Scroll+Stack_Prac
//
//  Created by 박준영 on 2021/09/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var stackView : UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.addArrangedSubview(adding())
    }
    
    
    func adding() -> UIView {
        let tempView = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "photo1")
        
        tempView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            tempView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            tempView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            tempView.topAnchor.constraint(equalTo: stackView.topAnchor),
            tempView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            tempView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            tempView.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: tempView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: tempView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: tempView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: tempView.bottomAnchor),
            imageView.widthAnchor.constraint(equalTo: tempView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: tempView.heightAnchor)
            

            
        ])
        tempView.addSubview(imageView)
        
        
        return tempView
        
    }
    
    
    

}

