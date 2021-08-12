//
//  SettingsTableViewCell.swift
//  FacebookMe
//
//  Created by 박준영 on 2021/08/12.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emoji: UIImageView!
    @IBOutlet weak var emojiLabel: UILabel!
    
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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
