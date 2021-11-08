//
//  TableViewCell.swift
//  animation
//
//  Created by 박준영 on 10/28/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    var label : UILabel = {
        let label : UILabel = UILabel()
        label.tintColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    override required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
