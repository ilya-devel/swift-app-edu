//
//  ViewController.swift
//  UICollectionViewTableFlowLayout
//
//  Created by Jonathan Rasmusson on 2019-01-10.
//  Copyright © 2019 Jonathan Rasmusson. All rights reserved.
//

import UIKit

class PhotoViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        tabBarItem.title = "Photos"
        setupViews()
    }

    func setupViews() {
        collectionView?.backgroundColor = .white
        collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
    }

}

extension PhotoViewController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        
        return cell
    }

}
