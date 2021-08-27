//
//  ViewController.swift
//  GoodAsOldPhones
//
//  Created by 박준영 on 2021/08/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView : UITableView!
    let assets = Assets()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
//        let taps = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(recognizer:)))
//        self.myTableView.addGestureRecognizer(taps)
//
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.backgroundColor = .gray
        return tableView
    }
    
    
//    @objc func handleTapGesture(recognizer : UITapGestureRecognizer){
    //제스처랑 didSelectRowAt메소드랑 같이 사용하면 에러남
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(identifier: "NextViewController") as DetailViewController
        let navVC = UINavigationController(rootViewController: nextViewController)
        navVC.modalPresentationStyle = .fullScreen
        
        
        present(navVC, animated: true, completion: nil)
        
    }
        
        
//        switch indexPath.row {
        //누를 때마다 누르는 상세페이지는 다르지만, 안에 Image랑 텍스트, 디테일만 다른 것일 뿐, 그니까 셀에 모델만 바꿔주면 됨. ㅇㅋ?
        
//        let cell = tableView.
//        case 0:
//        case 1:
//        case 2:
//        case 3:
        
}
    

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductsCell
        cell.productsImg.image = UIImage(named: assets.productsIconImage[indexPath.row])
        cell.productsLabel.text = assets.productsTitle[indexPath.row]
        
        return cell
    }
    
    
}

