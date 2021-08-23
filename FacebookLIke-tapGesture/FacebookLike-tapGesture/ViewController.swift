//
//  ViewController.swift
//  Practice
//
//  Created by 박준영 on 2021/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    let image = UIImageView() //사진
    let likeImage = UIImageView()//좋아요 사진
    
    let mainTitle = UILabel()       //LIKES 들어갈 라벨
    let likeCount = UILabel()       //좋아요 카운트 라벨
    let likeButton = UIButton()     //좋아요 버튼
    let cancelButton = UIButton()   //싫어요 버튼
    
    var count = 0                   //카운트 숫자
    var likes : Array<String> = [""]//mainTitle에 들어갈 String 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addSubviews()
        configureConstraint()
        contentDetails()
        //1
        let taps1 = UITapGestureRecognizer(target: self, action:  #selector(tapLikeButton))
        //3
        self.likeButton.addGestureRecognizer(taps1)
        
        //1
        let taps2 = UITapGestureRecognizer(target: self, action: #selector(tapCancelButton))
        //3
        self.cancelButton.addGestureRecognizer(taps2)
        cancelButton.isUserInteractionEnabled = true
        
    }
    //2 Like 액션
    @objc func tapLikeButton(recognizer : UITapGestureRecognizer){
        if recognizer.state == .ended {
            
            //좋아요가 0개 이상일 때 Like가 터치된다면, "LIKE" 문자열을 추가합니다.
            if count >= 0 {
                likes.append("LIKE")
            }
            //숫자로 표시될 count는 구애받지 않고 추가하고 표현합니다.
            count+=1
            likeCount.text = "\(count)"
            //최상단에 띄울 텍스트를 표시할 함수입니다.
            toText()
            
        }
    }
    //2  Cancle 액션
    @objc func tapCancelButton(recognizer : UITapGestureRecognizer){
        if recognizer.state == .ended {
            
            //좋아요가 0보다 클때만, likes 문자열에 "LIKE"를 추가합니다.
            if count > 0 {
                likes.removeLast()
                mainTitle.text = likes.joined()
            }
            //숫자로 표시될 count는 구애받지 않고 빼고 표현합니다.
            count-=1
            likeCount.text = "\(count)"
            //최상단에 띄울 텍스트를 표시할 함수입니다.
            toText()
            
        }
    }
    //최상단에 띄울 텍스트를 표시할 함수입니다.
    func toText(){
        //좋아요가 0개면 Like or Not?
        if count == 0 {
            mainTitle.text = "Like or Not?"
            likes.removeAll()
        //좋아요가 0미만이면
        }else if count < 0 {
            mainTitle.text = "I hate 싫어요!"
        //좋아요가 1이상이면
        }else {
            mainTitle.text = likes.joined()
        }
    }
    
    //view에 올리기
    private func addSubviews(){
        view.addSubview(mainTitle)
        view.addSubview(image)
        view.addSubview(likeImage)
        view.addSubview(cancelButton)
        view.addSubview(likeCount)
        view.addSubview(likeButton)
    }
    //label,image,button 텍스트, 이미지 설정
    private func contentDetails(){
        mainTitle.numberOfLines = 100 // LIKE 줄 제한
        mainTitle.font =
            UIFont.boldSystemFont(ofSize: 17)
        image.image = UIImage(named: "rose")
        likeImage.image = UIImage(named: "FacebookLike")
        likeButton.setTitle("Like", for: .normal)
        cancelButton.setTitle("Like Cancel", for: .normal)
        likeCount.text = "\(count)"
        likeCount.textAlignment = .center
        
    }
    //Constraint 설정
    private func configureConstraint(){
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        likeCount.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTitle.leadingAnchor.constraint(equalTo:self.image.leadingAnchor),
            mainTitle.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            mainTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            
            image.centerXAnchor.constraint(equalTo:self.view.centerXAnchor),
            image.topAnchor.constraint(equalTo: self.mainTitle.bottomAnchor, constant: 30),
            image.widthAnchor.constraint(equalToConstant: 300),
            image.heightAnchor.constraint(equalToConstant: 300),
            
            likeImage.centerXAnchor.constraint(equalTo: self.image.leadingAnchor, constant: 50),
            
            likeImage.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 30),
            likeImage.widthAnchor.constraint(equalToConstant: 50),
            likeImage.heightAnchor.constraint(equalTo: likeImage.widthAnchor, multiplier:0.7),
            
            likeButton.leadingAnchor.constraint(equalTo: self.likeImage.trailingAnchor, constant: 10),
            likeButton.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 30),

            cancelButton.leadingAnchor.constraint(equalTo: self.likeButton.trailingAnchor, constant: 10),
            cancelButton.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 30),

            
            likeCount.leadingAnchor.constraint(equalTo: likeImage.leadingAnchor, constant: -20),
            likeCount.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 35)
        ])

    }
    
   
}

