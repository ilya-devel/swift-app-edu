//
//  FriendCell.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class FriendCell: UITableViewCell, ThemeViewDelegate {
    func updateColor() {
        contentView.backgroundColor = AppData.currentTheme.background
        circle.backgroundColor = AppData.currentTheme.background
        photo.backgroundColor = AppData.currentTheme.background
        label.textColor = AppData.currentTheme.fontColor
    }
    
    private var circle: UIImageView = {
        let circle = UIImageView()
        circle.backgroundColor = AppData.currentTheme.background
        circle.layer.cornerRadius = 25
        return circle
    }()
    
    private var photo: UIImageView = {
        let photo = UIImageView(image: UIImage(systemName: "person"))
        photo.layer.cornerRadius = 25
        photo.backgroundColor = AppData.currentTheme.background
        return photo
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppData.currentTheme.fontColor
        label.text = "Anonim"
        return label
    }()
    
    private var labelStatus: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "online"
        label.textColor = .green
        label.font = .italicSystemFont(ofSize: 12)
        return label
    }()
    
    private func setupView() {
        contentView.backgroundColor = AppData.currentTheme.background
        contentView.addSubview(circle)
        circle.addSubview(photo)
        photo.contentMode = ContentMode.scaleAspectFit
        contentView.addSubview(label)
        contentView.addSubview(labelStatus)
        setConstraints()
    }
    
    func setupAboutFriend(friend: FriendModel) {
        label.text = (friend.lastName ?? "") + " " + (friend.firstName ?? "")
        if (friend.onlineStatus == 0) {
            labelStatus.text = "offline"
            labelStatus.textColor = .red
        }
        guard let photoUrl: URL = URL(string: friend.photoOrig!) else {return}
        
        DispatchQueue.global().async { [weak self] in guard let self = self else {return}
            guard let imageData = try? Data(contentsOf: photoUrl) else {return}
            
            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                self.photo.image = image
                self.photo.contentMode = UIView.ContentMode.scaleAspectFit
                self.photo.layer.cornerRadius = 25
            }
        }
    }
    
    private func setConstraints() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            circle.heightAnchor.constraint(equalToConstant: 50),
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
            
            photo.centerYAnchor.constraint(equalTo: circle.centerYAnchor),
            photo.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            photo.widthAnchor.constraint(equalTo: circle.widthAnchor),
            photo.heightAnchor.constraint(equalTo: circle.heightAnchor),
            
            label.leftAnchor.constraint(equalTo: circle.rightAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelStatus.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            labelStatus.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            labelStatus.leftAnchor.constraint(equalTo: circle.rightAnchor, constant: 20),
            labelStatus.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10)
            
            
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        ColorsSchemeControll.addView(newView: self)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview() {
    FriendCell()
}
