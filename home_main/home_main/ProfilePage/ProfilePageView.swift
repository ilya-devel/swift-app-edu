//
//  ProfilePageView.swift
//  home_main
//
//  Created by Ильяс Альфатович on 16.01.2025.
//

import UIKit

final class ProfilePageView: UIViewController {
    private var photo: UIImageView = {
        let photo = UIImageView(image: UIImage(systemName: "person"))
        photo.backgroundColor = .lightGray
        photo.contentMode = .scaleAspectFit
        return photo
    }()
    
    private var userName: UILabel = {
        let label = UILabel()
        label.text = "Anonim"
        label.textAlignment = .center
        var font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.font = font
        return label
    }()
    
    private var networkService = NetworkService()
    private var userModels: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElements()
        setupConstraints()
        networkService.getUserAbout {[weak self] users in self?.userModels = users
            DispatchQueue.main.async{
                self?.setupData()}
        }
    }
    
    private func addElements() {
        view.addSubview(photo)
        view.addSubview(userName)
    }
    
    private func setupConstraints() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            photo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photo.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            photo.heightAnchor.constraint(equalTo: photo.widthAnchor),
            
            userName.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 20),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupData() {
        let user = userModels[0]
        userName.text = (user.lastName ?? "") + " " + (user.firstName ?? "")
        guard let photoUrl: URL = URL(string: user.photoOrig!) else {return}
        
        DispatchQueue.global().async { [weak self] in guard let self = self else {return}
            guard let imageData = try? Data(contentsOf: photoUrl) else {return}
            
            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                self.photo.image = image
            }
        }
    }
}

#Preview {
    ProfilePageView()
}
