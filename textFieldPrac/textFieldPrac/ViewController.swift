//
//  ViewController.swift
//  textFieldPrac
//
//  Created by 박준영 on 10/1/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var tb : UITableView!
    @IBOutlet weak var tf : UITextField!
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var button : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tf.delegate = self
        
        tf.clearButtonMode = UITextField.ViewMode.always
        setting(textfield: tf)

    }
    
    func setting(textfield: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = UITextField.ViewMode.always
    }
    
    //리턴값에 따라 텍스트필드 활성/비활성
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    //텍스트 필드 edit시작 시
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("DidBeginEditing")
    }
    
    //리턴에 따라 텍스트 필드 편집 가능/불가능
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        
        return true
    }// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end

//
    func textFieldDidEndEditing(_ textField: UITextField){
        print("DidEndEditing")
    } // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

//
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) // if implemented, called in place of textFieldDidEndEditing:
//
//
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool // return NO to not change text
//
//
//
//    func textFieldDidChangeSelection(_ textField: UITextField)
//
//
//  // 텍스트 필드 초기화
    func textFieldShouldClear(_ textField: UITextField) -> Bool{
        return true
    }  // called when clear button pressed. return NO to ignore (no notifications)
    
    //Enter 입력 시
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.label.text = tf.text
        return true
    }
    @IBAction func pressEnter(){
        self.label.text = tf.text
    }
//
//
//
//
//

}
// 클로저가 있기에, 모델을 예측하고 만드는 것
// 모델만드는것과 api 생긴것만 잘 맞추면 된다.
// 데이터 받아오고 뷰를 그리는게 궁금
//그림을 그리는 곳과//  데이터를 받아서 갈아끼우는곳이 다름
//서치키에 내 아이디가 들어가고

//func requestFlickr(searchKey: String, completion: @escaping (_ data: [Photo]?) -> Void){
//  let apiKey = "be83bddb963d2ad00bcb99f8c9c43e1f"
//  guard let url: URL = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&text=\(searchKey)&per_page=20&format=json&nojsoncallback=1") else {
//    return
//  }
//  let dataTask: URLSessionTask = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
//    if let error = error{
//      print(error.localizedDescription)
//      return
//    }
////    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
////      completion(nil)
////      return
////    }
//    guard let data = data else{
//      return
//    }
//    do{
//      let apiResponse = try JSONDecoder().decode(fetchData.self, from: data)
//      completion(apiResponse.photos.photo)
//    }catch(let err){
//      print(err.localizedDescription)
//    }
//  }
//  dataTask.resume()
//}
