//
//  ViewController.swift
//  TodoList
//
//  Created by 박준영 on 11/3/21.
//

import UIKit

class ViewController: UIViewController{
   
    let mockData : [String] = ["1","2","3"]
    var tasks = [Task]()
    
    @IBOutlet var mytableView : UITableView!
    @IBOutlet var editButton : UIBarButtonItem!
    @IBOutlet var addButton : UIBarButtonItem!
    
    @IBAction func didTapAddButton(_ sender : UIButton) {
        let alert = UIAlertController(title:  "할 일 목록", message: "할 일을 입력해주세요", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.mytableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(registerButton)
        alert.addAction(cancelButton)
        alert.addTextField(configurationHandler: {
            textfield in textfield.placeholder = "할 일을 입력하세요"
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTapEditButton(_sender : UIButton) {
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableView.register(myTableViewCell.self, forCellReuseIdentifier: "Cell")
        mytableView.delegate = self
        mytableView.dataSource = self
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tasks.count)
        return tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! myTableViewCell
        cell.contentLabel?.text = self.tasks[indexPath.row].title

        return cell
    }
    
}

