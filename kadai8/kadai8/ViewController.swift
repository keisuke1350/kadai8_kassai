//
//  ViewController.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/15.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedLoginButton(_ sender: Any) {
        let vc = NextViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

