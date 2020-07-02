//
//  SemiModalViewController.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/29.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import FloatingPanel

class SemiModalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let sectionList = [
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
    
    var desc = [
    "2030年までに、現在１日1.25ドル未満で生活する人々と定義されている極度の貧困をあらゆる場所で終わらせる。",
    "2030年までに、各国定義によるあらゆる次元の貧困状態にある、全ての年齢の男性、女性、子供の割合を半減させる。",
    "各国において最低限の基準を含む適切な社会保護制度及び対策を実施し、2030年までに貧困層及び脆弱層に対し十分な保護を達成する。",
    "2030年までに、貧困層及び脆弱層をはじめ、全ての男性及び女性が、基礎的サービスへのアクセス、土地及びその他の形態の財産に対する所有権と管理権限、相続財産、天然資源、適切な新技術、マイクロファイナンスを含む金融サービスに加え、経済的資源についても平等な権利を持つことができるように確保する。",
    "2030年までに、貧困層や脆弱な状況にある人々の強靱性（レジリエンス）を構築し、気候変動に関連する極端な気象現象やその他の経済、社会、環境的ショックや災害に暴露や脆弱性を軽減する。",
    "あらゆる次元での貧困を終わらせるための計画や政策を実施するべく、後発開発途上国をはじめとする開発途上国に対して適切かつ予測可能な手段を講じるため、開発協力の強化などを通じて、さまざまな供給源からの相当量の資源の動員を確保する。",
    "貧困撲滅のための行動への投資拡大を支援するため、国、地域及び国際レベルで、貧困層やジェンダーに配慮した開発戦略に基づいた適正な政策的枠組みを構築する。"
    ]
    
    @IBOutlet weak var SDGsDesc: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        SDGsDesc.delegate = self
        SDGsDesc.dataSource = self
        
        let nib = UINib(nibName: "SemiModalTableViewCell", bundle: nil)
        SDGsDesc.register(nib, forCellReuseIdentifier: "tableViewCell")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SDGsDesc.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! SemiModalTableViewCell
        cell.tableViewText?.text = desc[indexPath.row]
        return cell
    }
}
