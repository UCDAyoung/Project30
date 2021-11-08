//
//  ViewController.swift
//  GithubApi
//
//  Created by 박준영 on 10/1/21.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    var followers : [Follower] = []

    @IBOutlet var tableView : UITableView!
    @IBOutlet weak var textField : UITextField!
    var tableViewCell : TableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.placeholder = "Github ID를 입력하세요"
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        followers = []
        
        if let text = textField.text?.lowercased(){
            print(text)
            requestGitAPI(searchKey: text) { [weak self] results in
                if let results = results {
                    self?.followers = results
                }
                
            }
        }
        return true
    }



}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
//        if let txt = followers[indexPath.row].login {
//            cell.label.text = txt
//        }
        
        guard let txt = followers[indexPath.row].login else {
            return print("hi")
        }
        print(followers[indexPath.row].login)
//        var content = cell.defaultContentConfiguration()
//        content.text = followers[indexPath.row].login
//        if let imageURL : URL = URL(string: "\(followers[indexPath.row].avatarURL)") {
//            let imageData = try! Data(contentsOf: imageURL)
//            content.image = UIImage(data: imageData)
//        }



//        cell.contentConfiguration = content
        
        return cell
    }
    
    
}
