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

    //테이블뷰생성
    let myTableView : UITableView = UITableView()
    //섹션
    let sectionNumber = SectionNumber()
    //헤더
    let header = HeaderInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
        register()
        
    }
    
    private func settings() {
            // add & delegate
        view.addSubview(myTableView)
        myTableView.delegate = self
        myTableView.dataSource = self
            // 크기 및 inset 설정
        myTableView.frame = view.bounds
        myTableView.separatorInset.left = 50
            //네비게이션 바 색상
        navigationController?.navigationBar.barTintColor = UIColor(red: 59, green: 89, blue: 152)
            //커스텀 헤더 등록
            //myTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")
    }
    
    private func register(){
        
        myTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profileCell")
        myTableView.register(ListTableViewCell.self, forCellReuseIdentifier: "listCell")
        myTableView.register(buttonTableViewCell.self, forCellReuseIdentifier: "buttonCell")
    }
    
    
    /// 헤더 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header.headerTitle[section]
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
}



    

// MARK: 셀에 관련된 정보
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    //섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNumber.number.count
    }
    //섹션 내부 행의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNumber.number[section]
    }
    
    //행에 무엇?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //구분은 섹션마다
        switch indexPath.section {
        
        case 0 :
            myTableView.rowHeight = 70
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileTableViewCell
            return cell
        case sectionNumber.number.count-1 :
            myTableView.rowHeight = 50
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell") as! buttonTableViewCell
            return cell
        default :
            myTableView.rowHeight = 50
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListTableViewCell
            cell.configureInfo(section: indexPath.section, row: indexPath.row)
            return cell
        }
    }
    
}



// 헥스 칼라 적용하기 위한 extension
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
