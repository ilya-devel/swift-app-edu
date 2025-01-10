//
//  ColumnFlowLayout.swift
//  home2
//
//  Created by Ильяс Альфатович on 08.01.2025.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()

        guard let cv = collectionView else { return }

        // set our width x height
        itemSize = CGSize(width: cv.bounds.inset(by: cv.layoutMargins).size.width/2, height: cv.bounds.inset(by: cv.layoutMargins).size.width/2)

        // set inset
        sectionInset = UIEdgeInsets(top: minimumInteritemSpacing, left: 2.0, bottom: 0.0, right: 2.0)

        // set inset reference
        sectionInsetReference = .fromSafeArea
    }
}
