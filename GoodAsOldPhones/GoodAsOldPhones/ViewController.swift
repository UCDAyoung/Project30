//
//  ViewController.swift
//  GoodAsOldPhones
//
//  Created by 박준영 on 2021/08/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView : UITableView!
    

    let productImgList : [String] = [
        "image-cell1",
        "image-cell2",
        "image-cell3",
        "image-cell4"
    ]
    let numberOfCellString : [String] = [
        "1907 Wall Set",
        "1921 Dial phone",
        "1937 Desh Set",
        "1984 Moto Portable"
    ]
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        let taps = UITapGestureRecognizer(target: myTableView, action: #selector(handleTapGesture))
        self.myTableView.addGestureRecognizer(taps)
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.backgroundColor = .gray
        return tableView
    }
    
    @objc func handleTapGesture(recognizer : UITapGestureRecognizer){
        print("Touch review")
    }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellView
        cell.productsImg.image = UIImage(named: productImgList[indexPath.row])
        cell.productsLabel.text = numberOfCellString[indexPath.row]
        
        return cell
    }
    
}

