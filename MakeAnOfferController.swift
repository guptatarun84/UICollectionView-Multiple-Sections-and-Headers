//
//  MakeAnOfferController.swift
//  ADF
//
//  Created by Gupta, Tarun K. on 10/5/17.
//  Copyright © 2017 Gupta, Tarun K. All rights reserved.
//

import UIKit

class MakeAnOfferController: UIViewController {
    
    @IBOutlet var verticalCollectionView: UICollectionView!
    var ve:Vehicle?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        verticalCollectionView.register(UINib(nibName: "OfferHeaderCell", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "OfferHeaderCell")
        verticalCollectionView.register(UINib(nibName: "APRHeaderCell", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "APRHeaderCell")
        verticalCollectionView.register(UINib.init(nibName: "ReviseOfferCell", bundle: nil), forCellWithReuseIdentifier: "ReviseOfferCell")
        
        // Do any additional setup after loading the view.
        verticalCollectionView.dataSource = self as UICollectionViewDataSource
//        verticalCollectionView.delegate = self as! UICollectionViewDelegate
        
        let layout = verticalCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.sectionHeadersPinToVisibleBounds = true
    }
}

// MARK: UICollectionViewDataSource

extension MakeAnOfferController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section==2) {
            return 2
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = verticalCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviseOfferCell", for: indexPath) as! ReviseOfferCell
        let cell = verticalCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviseOfferCell", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview = UICollectionReusableView()
        if (kind == UICollectionElementKindSectionHeader) {
            let section = indexPath.section
            switch (section) {
            case 1:
                let  firstheader: OfferHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "OfferHeaderCell", for: indexPath) as! OfferHeaderCell
                reusableview = firstheader
            case 2:
                let  secondHeader: APRHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "APRHeaderCell", for: indexPath) as! APRHeaderCell
                reusableview = secondHeader
            default:
                return reusableview
                
            }
        }
        return reusableview
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension MakeAnOfferController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.item == 0 {
            return CGSize(width: self.view.frame.size.width, height: 626.0)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if(section==0) {
            return CGSize.zero
        } else if (section==1) {
            return CGSize(width:collectionView.frame.size.width, height:133)
        } else {
            return CGSize(width:collectionView.frame.size.width, height:100)
        }

    }
}
