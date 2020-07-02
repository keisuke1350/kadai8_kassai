//
//  ThirdViewController.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/18.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class ThirdViewController: UIViewController, IndicatorInfoProvider {

    var itemInfo: IndicatorInfo = "Third"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
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
