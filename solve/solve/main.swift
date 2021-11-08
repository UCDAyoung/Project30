//
//  main.swift
//  solve
//
//  Created by 박준영 on 11/3/21.
//

import Foundation

enum whichIsBig : String{
    case left = ">"
    case right = "<"
    case same = "=="
}

func compareFunction(){
    let arr = readLine()!.trimmingCharacters(in: .whitespaces).split(separator: " ").map { Int(String($0))! }
    if arr[0] > arr[1] {
        print(whichIsBig.left.rawValue)
    }else if arr[0] < arr[1] {
        print(whichIsBig.right.rawValue)
    }else{
        print(whichIsBig.same.rawValue)
    }
    
}

compareFunction()
