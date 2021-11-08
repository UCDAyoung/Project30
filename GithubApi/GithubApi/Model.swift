//
//  Model.swift
//  GithubApi
//
//  Created by 박준영 on 10/1/21.
//

import Foundation

typealias Followers = [Follower]

struct Follower : Codable {
    let login : String
    let avatarURL : String
    
    enum CodingKeys : String, CodingKey{
        case login
        case avatarURL = "avatar_url"
    }
}
