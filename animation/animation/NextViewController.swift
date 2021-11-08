//
//  NextViewController.swift
//  animation
//
//  Created by 박준영 on 11/4/21.
//

import UIKit

class NextViewController: UIViewController {
    
    fileprivate let duration = 2.0
    fileprivate let delay = 0.2
    fileprivate let scale = 1.2
    
    
    var titleName = ""
    var button : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("animate", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapAnimateButton(_:)), for: .touchUpInside)
        return button
    }()
    
    var animateView : UIView = {
       let animateView = UIView()
        animateView.translatesAutoresizingMaskIntoConstraints = false
        animateView.backgroundColor = .red
        return animateView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        self.view.addSubview(animateView)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            animateView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.topAnchor.constraint(equalTo: animateView.bottomAnchor, constant: 30),
                        
            animateView.widthAnchor.constraint(equalToConstant: 100),
            animateView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        navigationController?.navigationBar.topItem?.title = titleName
        
    }
    
    //animate하기 전 뷰 그리기
    func setUp(){
        if titleName == "BezierCurve Position" {
              animateView = drawCircleView()
              
            } else if titleName == "View Fade In" {
              animateView = UIImageView(image: UIImage(named: "whatsapp"))
              animateView.frame = generalFrame
              animateView.center = generalCenter
            } else {
              animateView = drawRectView(UIColor.red, frame: generalFrame, center: generalCenter)
            }
            view.addSubview(animateView)
    }
    
    
    //animate하기
    //세팅 1 - backgroundcolor , animation
    //세팅 2 - image설정, animation
    
    @objc func didTapAnimateButton(_ sender : Any) {
        switch titleName {
            case "2-Color":
              changeColor(UIColor.green)
              
            case "Simple 2D Rotation":
              rotateView(Double.pi)
//
            case "Multicolor":
              multiColor(UIColor.green, UIColor.blue)
              
            case "Multi Point Position":
              multiPosition(CGPoint(x: animateView.frame.origin.x, y: 100), CGPoint(x: animateView.frame.origin.x, y: 350))
              
//            case "BezierCurve Position":
//              var controlPoint1 = self.animateView.center
//              controlPoint1.y -= 125.0
//              var controlPoint2 = controlPoint1
//              controlPoint2.x += 40.0
//              controlPoint2.y -= 125.0;
//              var endPoint = self.animateView.center;
//              endPoint.x += 75.0
//              curvePath(endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
//
//
//            case "Color and Frame Change":
//              let currentFrame = self.animateView.frame
//              let firstFrame = currentFrame.insetBy(dx: -30, dy: -50)
//              let secondFrame = firstFrame.insetBy(dx: 10, dy: 15)
//              let thirdFrame = secondFrame.insetBy(dx: -15, dy: -20)
//              colorFrameChange(firstFrame, secondFrame, thirdFrame, UIColor.orange, UIColor.yellow, UIColor.green)
//
//            case "View Fade In":
//              viewFadeIn()
//
//            case "Pop":
//              Pop()
//
            default:
              let alert = makeAlert("Alert", message: "The animation not implemented yet", actionTitle: "OK")
              self.present(alert, animated: true, completion: nil)
            }
    }
    fileprivate func changeColor(_ color: UIColor) {
        UIView.animate(withDuration: self.duration, animations: {
          self.animateView.backgroundColor = color
          }, completion: nil)
      }
    
    fileprivate func multiColor(_ firstColor : UIColor , _ secondColor : UIColor ){
        
        UIView.animate(withDuration: duration,
                       animations: {
                        self.animateView.backgroundColor = firstColor},
                       completion: { finished in
                        self.changeColor(secondColor)
                        
                       })
    }
    
    fileprivate func multiPosition(_ firstPos : CGPoint, _ secondPos : CGPoint){
        func simplePosition(_ pos : CGPoint){
            UIView.animate(withDuration: self.duration, animations: {
                self.animateView.frame.origin = pos
            }, completion : nil)
        }
        
        UIView.animate(withDuration: self.duration) {
            self.animateView.frame.origin = firstPos
        } completion: { finished in
            simplePosition(secondPos)
        }

        
    }
    
    fileprivate func rotateView(_ angle : Double){
        UIView.animate(withDuration: duration, delay: delay, options: [.repeat],animations : {
            self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        }, completion : nil)
    }
    
    
}
