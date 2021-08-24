//
//  ListInfo.swift
//  FacebookMe(re)
//
//  Created by 박준영 on 2021/08/22.
//

import Foundation

let list = ListInfo()
let favorites = FavoritesInfo()
let settings = SettingsInfo()

struct SectionInfo {
    var numberOfSecton : [Int] = [1,list.text.count,favorites.text.count,settings.text.count,1]
}

struct ListInfo {
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


