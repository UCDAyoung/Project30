//
//  buttonTableViewCell.swift
//  FacebookMe(re)
//
//  Created by 박준영 on 2021/08/15.
//

import UIKit

class buttonTableViewCell: UITableViewCell {
    //UI요소 생성
    let logoutButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(logoutButton)
        configureConstraints()
    }
    private func configureConstraints() {
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.setTitleColor(.red, for: .normal)
        NSLayoutConstraint.activate([
            logoutButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    

}
