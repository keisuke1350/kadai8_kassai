//
//  ViewController.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/15.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import TextFieldEffects
import Firebase
import FirebaseUI
import PKHUD

class ViewController: UIViewController, UITextFieldDelegate, FUIAuthDelegate{
    
    
    @IBOutlet weak var passwardTextField: KaedeTextField!
    
    @IBOutlet weak var authFBButton: UIButton!
    
    @IBOutlet weak var authGoogleButton: UIButton!
    
    
    
    var authUI: FUIAuth {get { return FUIAuth.defaultAuthUI()!}}
    //認証に使用するプロバイダの選択
    let providers: [FUIAuthProvider] = [
        FUIFacebookAuth(),
        FUIGoogleAuth()
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwardTextField.delegate = self
        passwardTextField.isSecureTextEntry = true
        self.authUI.delegate = self
        self.authUI.providers = providers
        authFBButton.addTarget(self, action: #selector(self.tappedFBButton(_:)), for: .touchUpInside)
        authGoogleButton.addTarget(self, action: #selector(tappedGoogleButton(_:)), for: .touchUpInside)
    }

    @IBAction func tappedLoginButton(_ sender: Any) {
        let vc = TabStripViewController()
        navigationController?.pushViewController(vc, animated: true)
        HUD.flash(.success, delay: 1)
    }
    
    @IBAction func tappedFBButton(_ sender: AnyObject) {
        //FirebasaseUIのviewの取得
        let authViewController = self.authUI.authViewController()
        //FirebaseUIのviewの表示
        self.present(authViewController, animated: true, completion: nil)
    }

    @IBAction func tappedGoogleButton(_ sender: AnyObject) {
        //FirebasaseUIのviewの取得
        let authViewController = self.authUI.authViewController()
        //FirebaseUIのviewの表示
        self.present(authViewController, animated: true, completion: nil)
    }
    
    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if error == nil{
            let vc = TabStripViewController()
            navigationController?.pushViewController(vc, animated: true)
            HUD.flash(.success, delay: 1)
        }
    }
    
    
    
}

