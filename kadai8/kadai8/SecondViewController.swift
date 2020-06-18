//
//  SecondViewController.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/17.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SecondViewController: UIViewController,IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var toDoTableView: UITableView!
    
    var itemInfo: IndicatorInfo = "Second"
    
    var tasks: [Task] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        let nib = UINib(nibName: "toDoTableViewCell", bundle: nil)
        toDoTableView.register(nib, forCellReuseIdentifier: "CustomCell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! toDoTableViewCell
        cell.LabelTableView?.text = tasks[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        reloadTableView()
    }
    
    func reloadTableView(){
        toDoTableView.reloadData()
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}
