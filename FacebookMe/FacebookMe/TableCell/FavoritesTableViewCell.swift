//
//  FavoritesTableViewCell.swift
//  FacebookMe
//
//  Created by 박준영 on 2021/08/12.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var textlable: UILabel!
    
    var favoritesLabel : [String] = [
        "muck bang",
        "k-pop",
        "temp"        
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
