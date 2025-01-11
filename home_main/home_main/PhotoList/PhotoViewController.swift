//
//  PhotoViewController.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class PhotoViewController: UICollectionViewController {

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
