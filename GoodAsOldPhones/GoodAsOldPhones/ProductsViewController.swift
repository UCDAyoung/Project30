//
//  ViewController.swift
//  GoodAsOldPhones
//
//  Created by 박준영 on 2021/08/16.
//

import UIKit

class ProductsViewController: UIViewController {

    @IBOutlet weak var myTableView : UITableView!
    let assets = Assets()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        myTableView.delegate = self
        myTableView.dataSource = self

    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.backgroundColor = .gray
        return tableView
    }
    
    
//    @objc func handleTapGesture(recognizer : UITapGestureRecognizer){
    //제스처랑 didSelectRowAt메소드랑 같이 사용하면 에러남
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "detailVC", sender: indexPath)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        guard let index = sender as? IndexPath else { return }
        detailVC.indexOfRow = index.row
//*** 조심!!! 단지 prepare로 데이터만 넘길 수 있지, 생성도 되지 않은 텍스트,이미지 설정을 한다는 건..!? 안돼!!
//        detailVC.titleLabel.text = assets.productsTitle[index.row]
//        detailVC.backImage.image = UIImage(named : assets.backImage[index.row])
    }
    
        
}
    

extension ProductsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assets.backImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductsCell
        cell.productsImg.image = UIImage(named: assets.productsIconImage[indexPath.row])
        cell.productsLabel.text = assets.productsTitle[indexPath.row]
        
        return cell
    }
    
    
}

