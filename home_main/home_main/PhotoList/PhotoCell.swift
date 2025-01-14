//
//  PhotoCell.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class PhotoCell: UICollectionViewCell {

    static let identifier = "PhotoCell"

    private var imageView = UIImageView()

    let separatorLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
//        imageView.contentMode = ContentMode.scaleAspectFit
    }
    
    func setupPhoto(photo: PhotoModel) {
        guard let photoUrl: URL = URL(string: photo.origPhoto.url!) else {return}
        
        DispatchQueue.global().async { [weak self] in guard let self = self else {return}
            guard let imageData = try? Data(contentsOf: photoUrl) else {return}
            
            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                self.imageView = UIImageView(image: image)
                self.imageView.frame = self.bounds
                self.imageView.contentMode = ContentMode.scaleAspectFit
                self.addSubview(self.imageView)
            }
        }
    }

}

