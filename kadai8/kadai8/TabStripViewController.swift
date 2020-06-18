//
//  TabStripViewController.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/17.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TabStripViewController: ButtonBarPagerTabStripViewController {
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationBar()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        //管理されるViewContorollerを返す処理
        let firstVC = NextViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        let childViewControllers:[UIViewController] = [firstVC,secondVC,thirdVC]
        return childViewControllers
    }
    
    private func setupNavigationBar(){
        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddScreen))
        navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    @objc func showAddScreen(){
        let vc = AddViewController()
        vc.tasks = tasks
        navigationController?.pushViewController(vc, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
