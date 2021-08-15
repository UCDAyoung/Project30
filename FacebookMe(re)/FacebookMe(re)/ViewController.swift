//
//  ViewController.swift
//  FacebookMe(re)
//
//  Created by 박준영 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myTableView: UITableView!
    
    
    let numberOfHeader : [String] = [" "," ","FAVORITES"," "," "]
    let numberOfSection : [Int] = [1,7,3,3,1]
    let contentOfLabel : [[String]] = [
        ["박준영","iOS개발자입니다."],
        ["Friends","Events","Groups","HARVARD","Town Hall","Instant Games","See More..."],
        ["Nflix","Books","See More..."],
        ["Settings","Privacy Shortcuts","Help and Support"],
        ["Log out"]
    ]
    let imgAssets : [[String]] = [
        ["fb_friends",
        "fb_events",
        "fb_groups",
        "fb_education",
        "fb_town_hall",
        "fb_games",],
        ["fb_settings",
        "fb_privacy_shortcuts",
        "fb_help_and_support"]
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.backgroundColor = UIColor(rgb :0xf7f7f7)
        settings()
    }
    func settings() {
        //네비게이션 바 색상
        navigationController?.navigationBar.barTintColor = UIColor(red: 59, green: 89, blue: 152)
        //커스텀 헤더 등록
        myTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")

    }
    //헤더 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return numberOfHeader[section]
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    //섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfHeader.count
    }
    //섹션 내부 행의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfSection[section]
    }
    //행에 무엇?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //구분은 섹션마다
        switch indexPath.section {
        //프로필
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! ProfileTableViewCell
            cell.profileImg.image = UIImage(named: "Profile")
            cell.profileLabel.text = contentOfLabel[indexPath.section][0]
            cell.profileDetailLabel.text = contentOfLabel[indexPath.section][1]
            return cell
        //리스트
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListTableViewCell
            if indexPath.row < 6 {
                cell.listImage.image = UIImage(named : imgAssets[0][indexPath.row])
            }
            cell.listLabel?.text = contentOfLabel[indexPath.section][indexPath.row]
            if indexPath.row == 6 {
                cell.listLabel.textColor = UIColor(red: 59, green: 89, blue: 152)
            }
            return cell
        //Favorite
        case 2 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListTableViewCell
            cell.listLabel?.text = contentOfLabel[indexPath.section][indexPath.row]
            if indexPath.row == 2 {
                cell.listLabel.textColor = UIColor(red: 59, green: 89, blue: 152)
            }
            return cell
        //privacy
        case 3 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListTableViewCell
            cell.listImage?.image = UIImage(named : imgAssets[0][indexPath.row])
            cell.listLabel?.text = contentOfLabel[indexPath.section][indexPath.row]
            return cell
        //button
        case 4 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell") as! buttonTableViewCell
            cell.logoutButton.setTitle("Log out", for: .normal)
            cell.tintColor = .red
            
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
