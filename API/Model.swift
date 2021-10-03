//
//  Model.swift
//  API
//
//  Created by 박준영 on 2021/09/26.
//

import Foundation

struct APIResponse : Codable {
    let results : [Friend]
}
struct Friend : Codable {
    struct Name : Codable {
        var title : String
        var first : String
        var last : String
        
        var full : String {
            return self.title.capitalized + ". " + self.first.capitalized + " " + self.last.capitalized
        }
        
    }
    struct Picture : Codable {
        let large : String
        let medium : String
        let thumbnail : String
    }
    let name: Name
    let email : String
    let picture : Picture
    
}
