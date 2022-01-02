//
//  ViewController.swift
//  loginLink2
//
//  Created by 박준영 on 2021/12/22.
//

import UIKit
import Firebase
import GoogleSignIn
import KakaoSDKCommon
import KakaoSDKUser

class ViewController: UIViewController{

    @IBOutlet weak var tf : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tf.delegate = self
    }
    
    
    
    @IBAction func tapGoogleLoginButton(sender: Any) {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            let signInConfig = GIDConfiguration.init(clientID: clientID)
            
          GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }

            guard let authentication = user?.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken!, accessToken: authentication.accessToken)
            // access token 부여 받음
            
            // 파베 인증정보 등록
            Auth.auth().signIn(with: credential) {_,_ in
                // token을 넘겨주면, 성공했는지 안했는지에 대한 result값과 error값을 넘겨줌
                print("complete Login")
                self.performSegue(withIdentifier: "nextVC", sender: nil)
            }
              
          }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "nextVC") as! NextViewController
        nextVC.modalPresentationStyle
        nextVC.present(self, animated: true, completion: nil)
    }
    
    //앱 , 웹
    //웹은 세션이라고 말을 하는데, 쿠키를 상속받아서 로그인을 유지하는 느낌, 쿠키에는 만료시간이 정해져있기 때문에 이 쿠키를 통해서 세션과 연락을 통해 로그인을 유지하는 것
    //앱 서버랑 항상 주소를 열어서 브라우저 api 는 한번만  -> 그래서 암호화
    //엑세스 토큰 : 만료시간 정해져있음 / refresh토큰 :만료시간이 긴 토큰
    

    @IBAction func tapKakaoLoginButton(sender : Any){
        
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
        
        //로그인?
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        self.performSegue(withIdentifier: "nextVC", sender: nil)
    
    }

}


extension ViewController : UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == idTextField {
            // 영문 소문자 1자리 이상
            textFieldCheck(idTextField, idContainerView, idErrorLabel, "^[a-z]{1,}$", "영문 소문자만 사용해 주세요!")
        } else if textField == pwTextField {
            // 영문 소문자 + 숫자 총 6자리 이상
            textFieldCheck(pwTextField, pwContainerView, pwErrorLabel, "^[a-z0-9]{6,}$", "형식에 맞게 사용해 주세요!")
        }
    }
    func textFieldCheck(_ tf: UITextField,_ cv: RoundedCornerView,_ errorLabel: UILabel,_ regex: String, _ alert: String) {
        if !textFieldNullCheck(tf,cv, errorLabel) {
        } else if !gsno(tf.text).hasCharacter(regex: regex) {
            // 컨테이너 뷰 빨간색으로 변경
            cv.setColor(.ff6E6E)
            errorLabel.text = alert
            errorLabel.textColor = .ff6E6E
        } else {
            cv.setColor(.lightGray)
            errorLabel.text = " "
        }
    }
    func textFieldNullCheck(_ tf: UITextField,_ cv: RoundedCornerView,_ label: UILabel) -> Bool {
        if tf.text == "" {
            // 컨테이너 뷰 빨간색으로 변경
            cv.setColor(.ff6E6E)
            label.text = "값을 입력해주세요"
            label.textColor = .ff6E6E
            return false
        } else { return true }
    }
    // 키보드 처리
    @objc func keyboardWillShow(notification: Notification) {
        self.view.frame.origin.y -= 50
    }
    @objc func keyboardWillHide(notification: Notification) {
        self.view.frame.origin.y = originY
    }
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // 영역을 클릭하면 블루로 변경
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idContainerView.setColor(.mainblue)
        } else {
            if idContainerView.pathColor == .mainblue {
                idContainerView.setColor(.lightGray)
            }
        }
        if textField == pwTextField {
            pwContainerView.setColor(.mainblue)
        } else {
            if pwContainerView.pathColor == .mainblue {
                pwContainerView.setColor(.lightGray)
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if gsno(idTextField.text).hasCharacter(regex: "^[a-z]{1,}$") &&
            gsno(pwTextField.text).hasCharacter(regex: "^[a-z0-9]{6,}$") {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .mainblue
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .lightGray
        }
    }
}
