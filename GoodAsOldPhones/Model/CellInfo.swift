//
//  cellInfo.swift
//  GoodAsOldPhones
//
//  Created by 박준영 on 2021/08/25.
//

import Foundation
import UIKit

internal class CellInfo {
    var imageView : UIImageView
    var label : UILabel
    private init(imageView : UIImageView , label : UILabel){
        self.imageView = imageView
        self.label = label
    }
}

struct Assets {

    
let backImage : [String] = [
    "phone-fullscreen1",
    "phone-fullscreen2",
    "phone-fullscreen3",
    "phone-fullscreen4"
]

let productsIconImage : [String] = [
    "image-cell1",
    "image-cell2",
    "image-cell3",
    "image-cell4"
]
let productsTitle : [String] = [
    "1907 Wall Set",
    "1921 Dial phone",
    "1937 Desh Set",
    "1984 Moto Portable"
]

}
