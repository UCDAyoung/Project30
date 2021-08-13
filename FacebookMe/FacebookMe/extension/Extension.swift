//
//  Extension.swift
//  FacebookMe
//
//  Created by 박준영 on 2021/08/13.
//

import UIKit

extension ViewController{
    //텍스트 삽입을 위해 사용함.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 2 {
            let text = "FAVORITES"
            return text
        }
        return ""
    }
    //색상을 변경하고 싶어서 사용함.
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader")
//        tableView.backgroundColor = UIColor(rgb :0xf7f7f7)
//        return header
//    }
}

/// header 텍스트 변경 메소드
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 20))
//        header.backgroundColor = UIColor(rgb: 0xf7f7f7)
//        switch section {
//        case 0,1:
//            let text = ""
//            return text
//        case 2:
//            let text = "FAVORITES"
//            return text
//        default :
//            return "FAVORITES"
//        }
//    }

/// header & secion 변경 return 이 UIView 가 위랑 차이점 이거로는 title 과 색상 둘다 변경 가능
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//        headerView.backgroundColor = UIColor(rgb: 0xf7f7f7)
//
//        let headerText = UILabel(frame : CGRect(x: 0, y: 0, width: 15, height:15))
//        headerText.text = "FAVORITES"
//
//        headerView.addSubview(headerText)
//        return headerView
//    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//        footerView.backgroundColor = UIColor(rgb: 0xf7f7f7)
//        return footerView
//    }
