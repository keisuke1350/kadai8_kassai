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
    
    //task情報の一覧・ここにすべての情報を保持しています。
    var tasks: [Task] = []
    
    private let photos = ["sdgs", "sdgs01", "sdgs02", "sdgs03", "sdgs04", "sdgs05","sdgs06", "sdgs07", "sdgs08", "sdgs09", "sdgs10", "sdgs11", "sdgs12", "sdgs13", "sdgs14", "sdgs15", "sdgs16", "sdgs17"]
    var imageArray = [UIImage?]()
    let Max_ARRAY_NUM = 18

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        //customcellの登録。
        //nibの読み込み。nibとxibはほぼ一緒。
        let nib = UINib(nibName: "toDoTableViewCell", bundle: nil)
        toDoTableView.register(nib, forCellReuseIdentifier: "CustomCell")
        
        for i in 0 ..< Max_ARRAY_NUM {
        let image = UIImage(named: photos[i])
        imageArray.append(image)
        }

    }
    
    //画面描写の度にtableviewを更新。
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //userdefaultsから呼び出し
        tasks = UserDefaultsRepository.loadFromUserDefaults()
        dump(tasks)
        reloadTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! toDoTableViewCell
        cell.LabelTableView?.text = tasks[indexPath.row].title
        cell.ImageTableView?.image = imageArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskDetailViewController()
        vc.selectIndex = indexPath.row
        vc.tasks = tasks
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tasks.remove(at: indexPath.row)
        UserDefaultsRepository.saveToUserDefaults(tasks)
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
