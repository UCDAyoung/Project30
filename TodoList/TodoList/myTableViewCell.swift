//
//  myTableViewCell.swift
//  TodoList
//
//  Created by 박준영 on 11/3/21.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
