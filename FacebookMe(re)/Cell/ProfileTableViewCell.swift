//
//  profileTableViewCell.swift
//  FacebookMe(re)
//
//  Created by 박준영 on 2021/08/15.
//

import UIKit
//커스텀해서 사용해보기
class myImageView : UIImageView {
        
}


class ProfileTableViewCell: UITableViewCell {
    
    let info = ProfileInfo(name: "박준영", detail : "iOS 개발자 될래요", imgName: "Profile")
    //인스턴스 생성
    let profileImg = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    //문서 확인하여 오버라이딩
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configureInfo()
        configureConstraint()
    }
    
    // addSubview로 view에 UiView올리기
    func addSubviews() {
        addSubview(profileImg)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    // constratin 설정
    func configureConstraint(){
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImg.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),//x
            profileImg.centerYAnchor.constraint(equalTo: self.centerYAnchor),//y
            profileImg.heightAnchor.constraint(equalToConstant: 50),//height
            profileImg.widthAnchor.constraint(equalToConstant: 50), // weight
            
            
            titleLabel.leadingAnchor.constraint(equalTo: self.profileImg.trailingAnchor,constant: 20),//x
            titleLabel.topAnchor.constraint(equalTo: self.profileImg.topAnchor),//y
            //label은 text크기 영향을 받아서 width, height설정을 하지 않아도 됨.
            
            subtitleLabel.bottomAnchor.constraint(equalTo: self.profileImg.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.profileImg.trailingAnchor, constant: 20)
                        
        ])
    }
    // Info 설정 / 이미지 및 텍스트 넣기
    func configureInfo(){
        profileImg.image = UIImage(named: self.info.imageName)
        titleLabel.text = self.info.name
        subtitleLabel.text = self.info.detail
    }
    
    //storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //배경색 넣는 텍스트용
    func testConfigure(){
        backgroundColor = .green
        titleLabel.backgroundColor = .yellow
        subtitleLabel.backgroundColor = .blue
    
    }

}
