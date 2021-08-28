//
//  ListTableViewCell.swift
//  FacebookMe(re)
//
//  Created by 박준영 on 2021/08/15.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    //데이터모델 생성
    let aboutMe = AboutMeInfo()
    let favorites = FavoritesInfo()
    let settings = SettingsInfo()
    // UI요소 생성
    let listImage = UIImageView()
    let listLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        addSubviews()
        configureConstraints()
        
    }
    
    //addsubview
    private func addSubviews(){
        addSubview(listImage)
        addSubview(listLabel)
    }

    //constraint설정
    private func configureConstraints(){
        listImage.translatesAutoresizingMaskIntoConstraints = false
        listLabel.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            listImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            listImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            listImage.heightAnchor.constraint(equalToConstant: 29),
            listImage.widthAnchor.constraint(equalToConstant: 29),
            
            listLabel.leadingAnchor.constraint(equalTo: self.listImage.trailingAnchor,constant: 20),
            listLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
        ])
    }
    // image 및 text 설정 - ViewController에서 사용되기 때문에, public
    public func configureInfo( section : Int, row : Int ){
        switch section {
        case 1:
            self.listImage.image = UIImage(named : aboutMe.image[row])
            self.listLabel.text = aboutMe.text[row]
            // See More... 파란색으로 변경
            if row == aboutMe.text.count-1 {
                self.listLabel.textColor = UIColor(red: 59, green: 89, blue: 152)
            }
        case 2:
            self.listLabel.text = favorites.text[row]
            self.imageView?.image = nil
            // See More... 파란색으로 변경
            if row == favorites.text.count-1 {
                self.listLabel.textColor = UIColor(red: 59, green: 89, blue: 152)
            }
            
        case 3:
            self.listImage.image = UIImage(named : settings.image[row])
            self.listLabel.text = settings.text[row]
        default:
            return
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


