//
//  ViewController.swift
//  LoginLink
//
//  Created by 박준영 on 2021/12/21.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @IBOutlet weak var signInButton: UIButton!
    

    @IBAction func didTap(){
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) {_,_ in
                       // token을 넘겨주면, 성공했는지 안했는지에 대한 result값과 error값을 넘겨줌
                    print("Login complete")
            
        }
    }
    
}
}
