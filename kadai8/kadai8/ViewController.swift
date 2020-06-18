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
    
//    var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()!}}
//    // 認証に使用するプロバイダの選択
//    let providers: [FUIAuthProvider] = [
//        FUIGoogleAuth(),
//        FUIFacebookAuth(),
//        FUIEmailAuth()
//    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwardTextField.delegate = self
        passwardTextField.isSecureTextEntry = true
//        self.authUI.delegate = self
//        self.authUI.providers = providers
//        authButton.addTarget(self, action: #selector(self.authButtonTapped(_:)), for: .touchUpInside)
    }

    @IBAction func tappedLoginButton(_ sender: Any) {
        let vc = TabStripViewController()
        navigationController?.pushViewController(vc, animated: true)
        HUD.flash(.success, delay: 1)
    }
    
//    @IBAction func authButtonTapped(_ sender: Any) {
//        let authViewController = self.authUI.authViewController()
//        self.present(authViewController, animated: true, completion: nil)
//    }
    
//    //　認証画面から離れたときに呼ばれる（キャンセルボタン押下含む）
//    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?){
//        // 認証に成功した場合
//        if error == nil {
//            let vc = TabStripViewController()
//            navigationController?.pushViewController(vc, animated: true)
//        } else {
//        //失敗した場合
//            print("error")
//        }
//    }
    
    
    
}

