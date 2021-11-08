//
//  NextViewController.swift
//  LedPrac
//
//  Created by 박준영 on 10/22/21.
//

import UIKit

protocol LEDBoardSettingDelegate : AnyObject {
    func changeLEDSetting(text: String?, textColor : UIColor, backgroundColor : UIColor)
}
class NextViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var storeButton: UIButton!
    
    weak var delegate : LEDBoardSettingDelegate?
    var textColor : UIColor = .yellow
    var backgroundcolor = UIColor.black
    var text : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self

    }
    @IBAction func tapTextButton(_ sender: UIButton) {
        if sender == yellowButton {
            changeTextColor(color: UIColor.yellow)
            self.textColor = .yellow
        }else if sender == orangeButton{
            changeTextColor(color: UIColor.orange)
            self.textColor = .orange
        }else if sender == greenButton{
            changeTextColor(color: UIColor.green)
            self.textColor = .green
        }
    }
    private func changeTextColor(color : UIColor){
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
        
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
        
    }
    @IBAction func tapBackgroundButton(_ sender: UIButton) {
        if sender == blackButton {
            changeBackgroundColor(color: UIColor.black)
            self.backgroundcolor = .black
        }else if sender == blueButton{
            changeBackgroundColor(color: UIColor.blue)
            self.backgroundcolor = .blue
        }else if sender == purpleButton{
            changeBackgroundColor(color: UIColor.purple)
            self.backgroundcolor = .purple
        }
    }
    private func changeBackgroundColor(color : UIColor){
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        
    }
    @IBAction func didTapStoreButton(_ sender: Any) {
        
        delegate?.changeLEDSetting(
            text: textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundcolor)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
