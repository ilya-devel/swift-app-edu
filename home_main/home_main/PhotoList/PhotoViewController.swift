//
//  PhotoViewController.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class PhotoViewController: UICollectionViewController {
    private var networkService = NetworkService()
    private var models: [PhotoModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        tabBarItem.title = "Photos"
        setupViews()
        networkService.getPhotos {[weak self] photos in self?.models = photos
            DispatchQueue.main.async{
                self?.collectionView.reloadData()
            }
        }
    }

    func setupViews() {
        collectionView?.backgroundColor = AppData.currentTheme.background
        collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
    }

}

extension PhotoViewController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell
        guard let cell = cell else {
            return UICollectionViewCell()
        }
        cell.setupPhoto(photo: models[indexPath.row])
        
        return cell
    }
}
