//
//  ViewController.swift
//  FacebookMe
//
//  Created by 박준영 on 2021/08/10.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var myTableView : UITableView!
    
    let listImages : [String] = [
        "fb_friends",
        "fb_events",
        "fb_groups",
        "fb_education",
        "fb_town_hall",
        "fb_games",
        "fb_games"
    ]
    var listLables : [String] = [
        "Friends",
        "Events",
        "Groups",
        "CNU",
        "Town Hall",
        "Instant Games",
        "See More..."
    ]
    var favoritesLabel : [String] = [
        "muck bang",
        "k-pop",
        "See More..."
    ]
    var settingsImages : [String] = [
        "fb_settings",
        "fb_privacy_shortcuts",
        "fb_help_and_support"
    ]
    var settingsLabel : [String] = [
        "Settings",
        "Privacy Shortcuts",
        "Help and Support"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Nib사용시 
//        let cellNib1 = UINib(nibName: String(describing: ProfileTableViewCell.self),bundle: nil)
//        self.myTableView.register(cellNib1, forCellReuseIdentifier: "profileTableViewCell")
//
//        let cellNib2 = UINib(nibName: String(describing: ListTableViewCell.self),bundle: nil)
//        self.myTableView.register(cellNib2, forCellReuseIdentifier: "listTableViewCell")
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //네비게이션 바 색상 넣기
        navigationController?.navigationBar.barTintColor = UIColor(red: 59, green: 89, blue: 152)
        //헤더커스텀 identifier등록하기
        myTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "customHeader")
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    //섹션 수를 전달하는 메소드(1부터)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    //섹션에 있는 행의 갯수를 전달받는 거 아님?(0부터)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 7
        case 2:
            return 3
        case 3:
            return 3
        case 4:
            return 1
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            cell.profileImg.image = UIImage(named: "Profile")
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell //처음에 as! 로 형변환 하지 않았을 때는 cell.emoji를 불러오지 못했음 ..이유가?
            cell.separatorInset.left = 50
            cell.listLabel.text = listLables[indexPath.row]
            if indexPath.row < 6 {
                print(indexPath.row)
                cell.emoji.image = UIImage(named: listImages[indexPath.row])
                cell.listLabel.text = listLables[indexPath.row]
            }else {
                cell.listLabel.text = "See More..."
                cell.listLabel.textColor = UIColor(red: 59, green: 89, blue: 152)
            }
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell", for: indexPath) as! FavoritesTableViewCell
            cell.separatorInset.left = 50
            if indexPath.row < 2 {
                cell.textlable.text = favoritesLabel[indexPath.row]
            }
            else {
                cell.textlable.text = "Add Favorites..."
                cell.textlable.textColor = UIColor(red: 59, green: 89, blue: 152)
            }
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsTableViewCell
            cell.emoji.image = UIImage(named: settingsImages[indexPath.row])
            cell.emojiLabel.text = settingsLabel[indexPath.row]
            cell.separatorInset.left = 50
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! LogOutTableViewCell
            cell.logoutButton.tintColor = .systemRed
            cell.separatorInset.left = 50
            
            return cell
            
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
}
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader")
//        tableView.backgroundColor = UIColor(rgb :0xf7f7f7)
//        header?.backgroundColor = UIColor(rgb :0xf7f7f7) - 위는 되고, 아래는 안되는 이유는??
//        if section == 2{
//            header?.textLabel?.text = "FAVORITES"
//        }
//            //header?.textLabel?.textAlignment = .center
//            //header?.textLabel?.textColor = .systemBlue
//            //header?.backgroundColor = .black
//
//            return header
//        }


    

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
