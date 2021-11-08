//
//  ViewController.swift
//  animation
//
//  Created by 박준영 on 10/27/21.
//

import UIKit

class ViewController: UIViewController {

    
    let titles : [String] = [
        "2-Color",
        "Simple 2D Rotation",
        "Multicolor",
        "Multi Point Position",
        "BezierCurve Porsition",
        "Color and Frame Change",
        "View Fade In"
    ]
    @IBOutlet weak var myTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        
    
        
//        self.view.addSubview(myView)
//        self.view.addSubview(myButton)
//
//        myView.backgroundColor = .black
//        myButton.backgroundColor = .blue
//        myView.center = view.center
//
//        myButton.setTitle("start", for: .normal)
//        myButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        
//
//
//        UIView.animate(withDuration: 2.0, delay: 1.0,
//                       usingSpringWithDamping: 0.8,
//                       initialSpringVelocity: 0.0,
//                       options: [.repeat],
//                       animations: {
//                        self.v.layer.position.x += 200.0
//                        self.v.layer.cornerRadius = 50.0
//                        self.v.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.0)
//                       }, completion: nil)
    }
//    @objc func didTapButton(_ sender : UIButton){
//        UIView.animate(withDuration: 2.0,
//                       animations: {
//                        self.myView.frame = CGRect(origin: CGPoint(x: 30, y: 30), size: CGSize(width: 100, height: 100))
//                       }) { done in
//            if done {
//                UIView.animate(withDuration: 1.0, animations: {
//                    self.myView.frame = CGRect(origin: CGPoint(x: 300,y: 300), size: CGSize(width: 30,height: 30))
//                })
//            }
//        }
//    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "NextVC", sender: indexPath)
    }
    
       
    //층에 따라 나눠서 준비?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as! NextViewController
        guard let indexPath = sender as? IndexPath else { return }
        VC.titleName = titles[indexPath.row]
        print(VC.titleName)
        
//        if let indexPath = indexPath {
//            VC.titleName = titles[indexPath.row]
//            print(titles[indexPath.row])
//        }
        
        
//        let selectedTitle = titles[sender]//선택된 이름
//        switch selectedTitle {
//        case "2-Color":
//
//        case "Simple 2D Rotation":
//
//        case "Multicolor":
//
//        case "Multi Point Position":
//
//        case "BezierCurve Porsition":
//
//        case "Color and Frame Change":
//
//        case "View Fade In":
//
//        default:
//            return;
//        }
//
//    }
    }

}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.label.text = self.titles[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Basic Animations"
    }
    
}
