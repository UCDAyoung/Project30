//
//  cellInfo.swift
//  FacebookMe(re)
//
//  Created by 박준영 on 2021/08/19.
//

import Foundation
import UIKit

let profileInfo = ProfileInfo(name: "박준영", detail : "iOS 개발자 될래요", imgName: "Profile")

struct ProfileInfo {
    let name : String
    let detail : String
    
    let imageName: String
    let image : UIImage?
    
    
    init(name : String, detail : String, imgName : String){
        self.name = name
        self.detail = detail
        
        self.imageName = imgName
        self.image = UIImage(named: imgName)
        
    }
}
