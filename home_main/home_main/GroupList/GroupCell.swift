//
//  GroupCell.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class GroupCell: UITableViewCell {
    private var circle: UIImageView = {
        let circle = UIImageView()
        circle.backgroundColor = .green
        circle.layer.cornerRadius = 25
        return circle
    }()
    
    private var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Name"
        return label
    }()
    
    private var desc: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Description"
        return label
    }()
    
    private func setupView() {
        contentView.addSubview(circle)
        contentView.addSubview(name)
        contentView.addSubview(desc)
        setConstraints()
        contentView.contentMode = ContentMode.scaleAspectFit
    }
    
    private func setConstraints() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            circle.heightAnchor.constraint(equalToConstant: 50),
            circle.widthAnchor.constraint(equalTo: circle.heightAnchor),
            
            name.leftAnchor.constraint(equalTo: circle.rightAnchor, constant: 20),
            name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            
            desc.leftAnchor.constraint(equalTo: circle.rightAnchor, constant: 20),
            desc.centerYAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            desc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAboutGroup (group: GroupModel) {
        name.text = group.groupName ?? ""
        desc.text = group.description ?? ""
        
        guard let photoUrl: URL = URL(string: group.photo200!) else {return}
        
        DispatchQueue.global().async { [weak self] in guard let self = self else {return}
            guard let imageData = try? Data(contentsOf: photoUrl) else {return}
            
            
            
            DispatchQueue.main.async {
//                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.circle.frame.width, height: self.circle.frame.height))
                
                let image = UIImage(data: imageData)
//                imageView.image = image
//                imageView.contentMode = UIView.ContentMode.scaleAspectFit
//                self.circle.addSubview(imageView)
                self.circle.image = image
                self.circle.contentMode = ContentMode.scaleAspectFit
            }
        }
    }
}

#Preview() {
    GroupCell()
}
