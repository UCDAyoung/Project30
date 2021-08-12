//
//  ListTableViewCell.swift
//  FacebookMe
//
//  Created by 박준영 on 2021/08/10.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var emoji: UIImageView!
    @IBOutlet weak var emojiLabel: UILabel!
    
    
    func setting() {
        
    }
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
