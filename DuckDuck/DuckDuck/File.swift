//
//  File.swift
//  DuckDuck
//
//  Created by 박준영 on 10/8/21.
//

import Foundation
import UIKit

/* 효주님 코드
 
class ViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  @IBAction func pushButtonClicked(_ sender: Any) {
    let strURL = “https://aws.random.cat/meow”
    guard let url = URL(string: strURL) else { return }
    var request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request){ (data, res, err) in
      if let err = err {
        print(err.localizedDescription)
        return
      }
      DispatchQueue.main.async {
        do {
//          let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary [원 코드]
          let decoder = JSONDecoder()
          let decoderData = try decoder.decode(Cat.self, from: data!)
          // Cat과 Cat.self의 차이점 알아보기
          print(decoderData.debugDescription)
          // API 호출했는데, 파싱이 안된 경우
          // 우리가 만든 모델링은 옵셔널이 안들어가 있음
          // 이럴 때 빈값이 들어온다면 파싱 에러가 난다.
          // 그럼 우리는 다 찍어보는 불상사가 ..
          print(type(of: decoderData.file))
//          guard let jsonObject = object else { return } [원 코드]
//          guard let imageString = jsonObject[“file”] as? String else {return} [원코드]
          //guard let imageURL = URL(string: imageString) else { return } [원 코드]
          guard let imageURL = URL(string: decoderData.file) else { return }
          let imageData = try Data(contentsOf: imageURL)
          self.imageView.image = UIImage(data: imageData)
        } catch let e as NSError{
          print(e.localizedDescription)
        }
      }
  }
    task.resume()
  }
}
struct Cat:Codable, CustomDebugStringConvertible {
  let file:String
  var debugDescription: String {   // 있으면 참 좋은 친구
    return "파싱에러라구요!!!-->> \(file)"
  }
}
*/
