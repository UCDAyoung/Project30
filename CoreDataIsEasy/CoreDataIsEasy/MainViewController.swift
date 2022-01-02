//
//  ViewController.swift
//  CoreDataIsEasy
//
//  Created by 박준영 on 9/30/21.
//

import UIKit

var memo = [Memo]()

class MainViewController: UIViewController{
    
    
    @IBOutlet weak var myTableView: UITableView!
    
            
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = storyboard?.instantiateViewController(identifier: "Add") as! AddViewController
//        present(vc, animated: true, completion: nil)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memo = DBManager.shared.fetchMemo()
        myTableView.reloadData()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
}

extension MainViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(memo.count)
        return memo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let partOfMemo = memo[indexPath.row]
        cell.textLabel?.text = partOfMemo.category
        cell.detailTextLabel?.text = partOfMemo.contents
        
        return cell
    }
    //? editing메소드.. 공부필요 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let context = DBManager.shared.context //관리 시작
            do {
                try context.delete(memo[indexPath.row]) // context가 관리자같은데..? 메소드로 delete메소드가 존재하는데?
                DBManager.shared.saveContext()
//                memo.remove(at: indexPath.row) //띠용?? 위에도 delete가 있는데..? 뭐지..
                tableView.deleteRows(at: [indexPath], with: .automatic) //와 테이블뷰에 열을 삭제하는게 존재하네
            }catch {
                print("error")
            }
        }
    }
    
}
