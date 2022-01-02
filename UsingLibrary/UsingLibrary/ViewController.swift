//
//  ViewController.swift
//  UsingLibrary
//
//  Created by 박준영 on 2021/12/28.
//

import UIKit
import WCLShineButton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setupButton()
    }
    
    func setupButton(){
        var param1 = WCLShineParams()
        param1.bigShineColor = UIColor(hex: "#eeeeee")
        param1.smallShineColor = UIColor(hex: "#eeeeee")
        let bt1 = WCLShineButton(frame: .init(x: 100, y: 100, width: 50, height: 50), params: param1)
        bt1.fillColor = UIColor(hex: "#eeeeee")
        bt1.color = UIColor(hex: "#eeeeee")
        bt1.addTarget(self, action: #selector(action1), for: .valueChanged)
        bt1.image = WCLShineImage.star
        view.addSubview(bt1)
        
        var param2 = WCLShineParams()
        param2.bigShineColor = UIColor(hex: "#eeeeee")
        param2.smallShineColor = UIColor(hex: "#eeeeee")
        let bt2 = WCLShineButton(frame: .init(x: 170, y: 100, width: 50, height: 50), params: param2)
        bt2.fillColor = UIColor(hex: "#eeeeee")
        bt2.color = UIColor(hex: "#eeeeee")
        bt2.addTarget(self, action: #selector(action1(event:)), for: .valueChanged)
        bt2.image = WCLShineImage.heart
        view.addSubview(bt2)
        
                        
        
    }
    
    @objc
    func action1(event : UIButton){
        print("Button1")
        if(event.isEnabled == true){
            print("enabled")
        }
    }
    @objc
    func action2(){
        print("Button2")
    }
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    // hex코드를 rgb로 바꿔서 색상을 출력하는 기능
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    // hex코드로 색상 변환하는 기능
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format:"#%06x", rgb) as String
    }
    
}
