//
//  ProfileTableViewCell.swift
//  FacebookMe
//
//  Created by 박준영 on 2021/08/10.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileDetail: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
