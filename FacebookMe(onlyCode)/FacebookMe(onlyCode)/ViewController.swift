//
//  ViewController.swift
//  FacebookMe(re)
//
//  Created by 박준영 on 2021/08/14.
//

import UIKit


//
//struct configureInfo{
//    var image : UIImage
//    var text : String
//}
//

class ViewController: UIViewController {

    
//    @IBOutlet weak var myTableView: UITableView!
    
    let myTableView : UITableView = UITableView()
    let sectionInfo = SectionInfo()
    let header = HeaderInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myTableView)
        
        myTableView.frame = view.bounds
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        register()
        settings()
    }
    
    private func register(){
        myTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profileCell")
        myTableView.register(ListTableViewCell.self, forCellReuseIdentifier: "listCell")
        myTableView.register(buttonTableViewCell.self, forCellReuseIdentifier: "buttonCell")
    }
    private func settings() {
        //네비게이션 바 색상
        navigationController?.navigationBar.barTintColor = UIColor(red: 59, green: 89, blue: 152)
        //커스텀 헤더 등록
//        myTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")
//
    }
    //헤더 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header.headerTitle[section]
    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return " "
//    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
}

    




extension ViewController : UITableViewDelegate,UITableViewDataSource{
    //섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionInfo.numberOfSecton.count
    }
    //섹션 내부 행의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionInfo.numberOfSecton[section]
    }
    
    //행에 무엇?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //구분은 섹션마다
        switch indexPath.section {
        
        case 0 :
            myTableView.rowHeight = 70
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileTableViewCell
        
            return cell
        //디폴트
        case 1,2,3 :
            myTableView.rowHeight = 50
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListTableViewCell
            cell.configureInfo(section: indexPath.section, row: indexPath.row)
            return cell
        case 4 :
            myTableView.rowHeight = 50
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell") as! buttonTableViewCell
            
            return cell
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
}



/// 헥스 칼라 적용하기 위한 extension
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
