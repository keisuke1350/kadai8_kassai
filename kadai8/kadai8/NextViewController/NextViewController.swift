//
//  NextViewController.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/15.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import FloatingPanel

class NextViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, IndicatorInfoProvider, FloatingPanelControllerDelegate {
    

    var itemInfo: IndicatorInfo = "First"
    
    var floatingPanelController: FloatingPanelController!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = sdgsCollectionView.dequeueReusableCell(withReuseIdentifier: "sdgsCollectionCell", for: indexPath)
        let photoImageView = cell.contentView.viewWithTag(1)  as! UIImageView
        let photoImage = UIImage(named: photos[indexPath.row])
        photoImageView.image = photoImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace : CGFloat = 20
        let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace
        return CGSize(width: cellSize, height: cellSize)
    }

        private let photos = ["sdgs", "sdgs01", "sdgs02", "sdgs03", "sdgs04", "sdgs05","sdgs06", "sdgs07", "sdgs08", "sdgs09", "sdgs10", "sdgs11", "sdgs12", "sdgs13", "sdgs14", "sdgs15", "sdgs16", "sdgs17"]
    
    @IBOutlet weak var sdgsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sdgsCollectionView.delegate = self
        sdgsCollectionView.dataSource = self
        
        sdgsCollectionView.register(UINib(nibName: "sdgsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sdgsCollectionCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        sdgsCollectionView.collectionViewLayout = layout
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        floatingPanelController = FloatingPanelController()
        floatingPanelController.surfaceView.cornerRadius = 24.0
        
        let semiModalViewController = SemiModalViewController()
        floatingPanelController.delegate = self
        floatingPanelController.set(contentViewController: semiModalViewController)
        floatingPanelController.addPanel(toParent: self, belowView: nil, animated: false)
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        floatingPanelController.removePanelFromParent(animated: true)
//    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return CustomFloatingPanelLayout()
    }
    
    class CustomFloatingPanelLayout: FloatingPanelLayout {
        // 初期位置
        var initialPosition: FloatingPanelPosition {
            return .half
        }
        
        // カスタマイズした高さ
        func insetFor(position: FloatingPanelPosition) -> CGFloat? {
            switch position {
            case .full: return 16.0
            case .half: return 216.0
            case .tip: return 44.0
            default: return nil
            }
        }
        
        // サポートする位置
        var supportedPositions: Set<FloatingPanelPosition> {
            return [.full, .half, .tip]
        }
    }
}
