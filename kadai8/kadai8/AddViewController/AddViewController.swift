//
//  AddViewController.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/18.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import PKHUD

class AddViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var selectSDGs: UITextField!
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var SDGsImage: UIImageView!
    
    var tasks: [Task] = []
    
    var pickerView: UIPickerView = UIPickerView()
    let picklist = [
        "",
        "1 貧困を無くそう",
        "2 飢餓をゼロに",
        "3 すべての人に健康と福祉を",
        "4 室の高い教育をみんなに",
        "5 ジェンダー平等を実現しよう",
        "6 安全な水とトイレを世界中に",
        "7 エネルギーをみんなに そしてクリーンに",
        "8 働きがいも経済成長も",
        "9 産業と技術革新の基盤をつくろう",
        "10 人や国の不平等を無くそう",
        "11 住み続けられるまちづくりを",
        "12 つくる責任 つかう責任",
        "13 気候変動に具体的な対策を",
        "14 海の豊かさを守ろう",
        "15 陸の豊かさも守ろう",
        "16 平和と公正をすべての人に",
        "17 パートナーシップで目標を達成しよう"
    ]
    
    private let photos = ["sdgs", "sdgs01", "sdgs02", "sdgs03", "sdgs04", "sdgs05","sdgs06", "sdgs07", "sdgs08", "sdgs09", "sdgs10", "sdgs11", "sdgs12", "sdgs13", "sdgs14", "sdgs15", "sdgs16", "sdgs17"]
    
    var imageArray = [UIImage?]()
    let Max_ARRAY_NUM = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerView.delegate = self
        pickerView.dataSource = self
        self.selectSDGs.text = picklist[0]
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddViewController.done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(AddViewController.cancel))
        toolbar.setItems([cancelItem,doneItem], animated: true)
        
        self.selectSDGs.inputView = pickerView
        self.selectSDGs.inputAccessoryView = toolbar
        
        // TextViewの罫線
            memoTextView.layer.cornerRadius = 5
            memoTextView.layer.borderColor = UIColor.lightGray.cgColor
            memoTextView.layer.borderWidth  = 0.8
            memoTextView.layer.masksToBounds = true
        
        for i in 0 ..< Max_ARRAY_NUM {
        let image = UIImage(named: photos[i])
        imageArray.append(image)
        }
        
        setUpNavigationBar()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picklist.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picklist[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectSDGs.text = picklist[row]
        self.SDGsImage.image = imageArray[row]
    }
    @objc func done(){
        self.selectSDGs.endEditing(true)
    }
    
    @objc func cancel(){
        self.selectSDGs.text = ""
        self.selectSDGs.endEditing(true)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setUpNavigationBar(){
        title = "add"
        let rightButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(tapSaveButton))
        navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    @objc func tapSaveButton(){
        print("Saveボタンを押したよ")
        guard let title = titleTextField.text else { return
        }
        guard let select = selectSDGs.text else { return
        }
        let task = Task(title: title, memo: memoTextView.text, select: select)
        tasks.append(task)
        UserDefaultsRepository.saveToUserDefaults(tasks)
        
        HUD.flash(.success, delay: 0.3)
        navigationController?.popViewController(animated: true)
    }

}
