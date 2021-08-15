//
//  profileTableViewCell.swift
//  FacebookMe(re)
//
//  Created by 박준영 on 2021/08/15.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
