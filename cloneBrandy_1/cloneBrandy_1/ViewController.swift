//
//  ViewController.swift
//  cloneBrandy_1
//
//  Created by 박준영 on 2021/12/30.
//

import UIKit

class ViewController: UIViewController {

    
    //이모티콘 : 안녕
        //위치 : 중간 , 아래 텍스트에서 Constraint
    var emoticonText : UILabel = {
        let emoticonText = UILabel()
        emoticonText.text = "👋"
        
        return emoticonText
    }()

    //연령대를 선택해주세요!
        //위치 : 아래 텍스트에 Constraint
    var text1 : UILabel = {
        let text1 = UILabel()
        text1.text = "연령대를\n 선택해주세요!"
        text1.numberOfLines = 2
        //텍스트 중간정렬 필요
        text1.textAlignment = .center
        //스타일: 볼드체
        text1.font = UIFont.boldSystemFont(ofSize: 20)
        return text1
    }()
    //딱 맞는 인기상품을 추천해드릴게요.
        //위치 : 중간에서 위로 Constraint
    var text2 : UILabel = {
        let text2 = UILabel()
        text2.text = "딱 맞는 인기상품을 추천해드릴게요."
        text2.font = UIFont.boldSystemFont(ofSize: 12)

        
        //색상 : 그레이
        text2.textColor = .systemGray
        return text2
    }()
    
    //나이 버튼 : 10,20~24,25~29,30~34,35세 이상
        //위치 : 중간 위치로부터 아래로 constraint
        //버튼 클릭시 빨간색
    var ageButton1 : UIButton = {
        let ageButton1 = UIButton()
        ageButton1.setTitle("10대", for: .normal)
        ageButton1.addTarget(self, action: #selector(didtTapAgeButton(sender:)), for: .touchUpInside)
        ageButton1.setTitleColor(.darkGray, for: .normal)
        ageButton1.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        ageButton1.layer.borderWidth = 2
        ageButton1.layer.cornerRadius = 15
        
        return ageButton1
    }()
    var ageButton2 : UIButton = {
        let ageButton2 = UIButton()
        ageButton2.setTitle("20~24세", for: .normal)
        ageButton2.addTarget(self, action: #selector(didtTapAgeButton(sender:)), for: .touchUpInside)
        ageButton2.layer.borderWidth = 2
        ageButton2.setTitleColor(.darkGray, for: .normal)
        ageButton2.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        ageButton2.layer.cornerRadius = 15
        
        return ageButton2
    }()
    var ageButton3 : UIButton = {
        let ageButton3 = UIButton()
        ageButton3.setTitle("25~29세", for: .normal)
        ageButton3.layer.borderWidth = 2
        ageButton3.addTarget(self, action: #selector(didtTapAgeButton(sender:)), for: .touchUpInside)
        ageButton3.setTitleColor(.darkGray, for: .normal)
        ageButton3.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        ageButton3.layer.cornerRadius = 15
        return ageButton3
    }()
    var ageButton4 : UIButton = {
        let ageButton4 = UIButton()
        ageButton4.setTitle("30~34세", for: .normal)
        ageButton4.setTitleColor(.darkGray, for: .normal)
        ageButton4.addTarget(self, action: #selector(didtTapAgeButton(sender:)), for: .touchUpInside)
        ageButton4.layer.borderWidth = 2
        ageButton4.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        ageButton4.layer.cornerRadius = 15
        return ageButton4
    }()
    var ageButton5 : UIButton = {
        let ageButton5 = UIButton()
        ageButton5.setTitle("35세 이상", for: .normal)
        ageButton5.setTitleColor(.darkGray, for: .normal)
        ageButton5.addTarget(self, action: #selector(didtTapAgeButton(sender:)), for: .touchUpInside)
        ageButton5.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        ageButton5.layer.borderWidth = 2
        ageButton5.layer.cornerRadius = 15
        return ageButton5
    }()
    var ageButton6 : UIButton = {
        let ageButton6 = UIButton()
        
        return ageButton6
    }()
    var parentStackView : UIStackView = UIStackView()
    var childStackView1 : UIStackView = UIStackView()
    var childStackView2 : UIStackView = UIStackView()
                
    
    //다음 버튼 누를시 애니메이션 존재
        //아래부터 Constraint
    lazy var nextButton : UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        nextButton.backgroundColor = .gray
        nextButton.layer.cornerRadius = CGFloat(8)
        nextButton.addTarget(self, action: #selector(didtTapAgeButton(sender:)), for: .touchUpInside)
        nextButton.isEnabled = false
        return nextButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubView()
        setupConstraint()
        setupStackView()
        
        
    }
    
    func addSubView(){
        
        self.view.addSubview(emoticonText)
        self.view.addSubview(text1)
        self.view.addSubview(text2)
        self.view.addSubview(nextButton)
        self.view.addSubview(parentStackView)
    
    }
    
    func setupConstraint(){
        
        self.emoticonText.translatesAutoresizingMaskIntoConstraints = false
        self.text1.translatesAutoresizingMaskIntoConstraints = false
        self.text2.translatesAutoresizingMaskIntoConstraints = false
        self.ageButton1.translatesAutoresizingMaskIntoConstraints = false
        self.ageButton2.translatesAutoresizingMaskIntoConstraints = false
        self.ageButton3.translatesAutoresizingMaskIntoConstraints = false
        self.ageButton4.translatesAutoresizingMaskIntoConstraints = false
        self.ageButton5.translatesAutoresizingMaskIntoConstraints = false
        self.parentStackView.translatesAutoresizingMaskIntoConstraints = false
        self.nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - 가운데 정렬
        NSLayoutConstraint.activate([
            self.emoticonText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.text1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.text2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.parentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        //MARK: - 다음 버튼
        NSLayoutConstraint.activate([
            self.nextButton.widthAnchor.constraint(equalToConstant: 250),
            self.nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        //MARK: - 나머지constraint
        NSLayoutConstraint.activate([
            self.parentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.parentStackView.widthAnchor.constraint(equalToConstant: 230),
            self.parentStackView.heightAnchor.constraint(equalToConstant: 70),
            self.text2.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            self.text1.bottomAnchor.constraint(equalTo: text2.topAnchor, constant: -5),
            self.emoticonText.bottomAnchor.constraint(equalTo: text1.topAnchor, constant: -5),
            self.nextButton.bottomAnchor.constraint(greaterThanOrEqualTo: self.view.bottomAnchor, constant: -50)
        ])
        
        //MARK: - 스택 안의 버튼
                        
        
    }
    func setupStackView(){
        childStackView1.addArrangedSubview(ageButton1)
        childStackView1.addArrangedSubview(ageButton2)
        childStackView1.addArrangedSubview(ageButton3)
        childStackView2.addArrangedSubview(ageButton6)
        childStackView2.addArrangedSubview(ageButton4)
        childStackView2.addArrangedSubview(ageButton5)
        childStackView2.addArrangedSubview(ageButton6)
        parentStackView.axis = .vertical
        parentStackView.addArrangedSubview(childStackView1)
        parentStackView.addArrangedSubview(childStackView2)
        parentStackView.distribution = .fillEqually
        childStackView1.distribution = .fillEqually
        childStackView2.distribution = .fillEqually
        
        
        parentStackView.spacing = 9
        childStackView1.spacing = 6
        childStackView2.spacing = 6
    }

    
    @objc
    func didtTapAgeButton(sender: UIButton){
        //클릭 시
        sender.backgroundColor = .systemBlue
        nextButton.isEnabled = true
        nextButton.backgroundColor = .black
    }
    @objc
    func didtTapNextButton(sender: UIButton){

        
    }
    
}

