//
//  ListInfo.swift
//  FacebookMe(re)
//
//  Created by 박준영 on 2021/08/22.
//

import Foundation

//??인스턴스를 생성해서 사용하는게 이상한 것 같음. 구조가 이상함..질문 반드시 필요
let aboutMe = AboutMeInfo()
let favorites = FavoritesInfo()
let settings = SettingsInfo()
//섹션 갯수
struct SectionNumber {
    var number : [Int] = [1,aboutMe.text.count,favorites.text.count,settings.text.count,1]
}
//AboutMe + Favorites + Settings 데이터모델
struct AboutMeInfo {
    let text : [String] = [
        "Friends",
        "Events",
        "Groups",
        "CNU",
        "Town Hall",
        "Instant Games",
        "See More..."
    ]
    let image : [String] = [
        "fb_friends",
        "fb_events",
        "fb_groups",
        "fb_education",
        "fb_town_hall",
        "fb_games",
        ""
    ]
}
struct FavoritesInfo {
    let text : [String] = [
        "muck bang",
        "k-pop",
        "See More..."
    ]
}

struct SettingsInfo {
    let text : [String] = [
        "Settings",
        "Privacy Shortcuts",
        "Help and Support"
    ]
    let image : [String] = [
        "fb_settings",
        "fb_privacy_shortcuts",
        "fb_help_and_support"
    ]
}


