//
//  ViewController.swift
//  API
//
//  Created by 박준영 on 2021/09/26.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var textLabel :UILabel!
    @IBOutlet weak var detailLabel : UILabel!
    
    let reuseIdentifier = "Cell"
    var friends : [Friend] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
        let friend : Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name.full
        cell.detailTextLabel?.text = friend.email
        cell.imageView?.image = nil
        //global().async -> 백그라운드에서 실행
        DispatchQueue.global().async {
            guard let imageURL : URL = URL(string: friend.picture.thumbnail) else {return}
            guard let imageData : Data = try? Data(contentsOf: imageURL) else { return}
            //main.async -> 메인 스레드에서 실행
            DispatchQueue.main.async {
                // 인덱스를 나중에 설정해서 보내기위함
                if let index : IndexPath = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row{
                        
                        cell.imageView?.image = UIImage(data: imageData)
                        cell.setNeedsLayout()
                        cell.layoutIfNeeded()
                    }
                }
                
                
                
            }
        }
                    
        
        return cell
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url : URL = URL(string: "https://randomuser.me/api/?results=20&inc=name,email,picture") else {
            return
        }
        let session : URLSession = URLSession(configuration: .default)
        let dataTask : URLSessionDataTask = session.dataTask(with: url) { (data : Data?, response: URLResponse?, error : Error?) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {return}
            
            do {
                let apiResponse : APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.friends = apiResponse.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch(let err){
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpShowAlert(_ sender : UIButton){
        showAlertController(style: .alert)
    }
    @IBAction func touchUpShowActionSheet(_ sender : UIButton){
        showAlertController(style: .actionSheet)
    }
    func showAlertController(style: UIAlertController.Style){
        let alertController = UIAlertController(title: "title", message: "message", preferredStyle: style)
        
        //UIAction이랑 UIAlertAction차이점이 뭐지?
        //클로저
        let okAction : UIAlertAction
        okAction = UIAlertAction(title: "okTitle", style: .default, handler: { ( action : UIAlertAction) in
            print("ok pressed")
        })
        let cancelAction : UIAlertAction
        cancelAction = UIAlertAction(title: "cancelTitle", style: .destructive, handler: nil )
        
        
        //버튼리스트 순서에도 관여
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        //텍스트필드는 actionsheet가 아닌 alert에만 적용이 가능
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "입력하세요"
            textField.textColor = .red
        }
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    

}

