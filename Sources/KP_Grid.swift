//
//  KP_Grid.swift
//  Kboard_Gallery
//
//  Created by Jose De Jesus Garfias Lopez on 8/15/17.
//  Copyright © 2017 Karmapulse. All rights reserved.
//

import UIKit

class KP_Grid: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame : frame);
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10);
        layout.itemSize = CGSize(width: 300, height: 300);
        
        
        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout);
        
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell");
        collectionView.backgroundColor = UIColor.white;
        
        self.addSubview(collectionView);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }

}
