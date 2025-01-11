//
//  GroupCell.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class GroupCell: UITableViewCell {
    private var circle: UIView = {
        let circle = UIView()
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
            
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            desc.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
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
}

#Preview() {
    GroupCell()
}
