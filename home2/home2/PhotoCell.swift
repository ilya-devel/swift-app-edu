//
//  SupportArticleCell.swift
//  UICollectionViewTableFlowLayout
//
//  Created by Jonathan Rasmusson (Contractor) on 2019-01-10.
//  Copyright © 2019 Jonathan Rasmusson. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {

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

        backgroundColor = .blue

        addSubview(imageView)
        addSubview(separatorLineView)

        separatorLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        separatorLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        separatorLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }

}
