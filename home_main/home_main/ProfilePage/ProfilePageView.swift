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
        photo.backgroundColor = AppData.currentTheme.background
        photo.contentMode = .scaleAspectFit
        return photo
    }()
    
    private var userName: UILabel = {
        let label = UILabel()
        label.text = "Anonim"
        label.textAlignment = .center
        var font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.font = font
        label.textColor = AppData.currentTheme.fontColor
        return label
    }()
    
    private var networkService = NetworkService()
    private var userModels: [UserModel] = []
    
    var titleSetChoice: UILabel = {
        let label = UILabel()
        label.backgroundColor = AppData.currentTheme.background
        label.textColor = AppData.currentTheme.fontColor
        label.text = "Choice Theme"
        return label
    }()
    
    var btnLightTheme: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = AppData.currentTheme.btnBackground
        btn.tag = 1
        btn.setTitle("Light Theme", for: .normal)
        btn.setTitleColor(AppData.currentTheme.fontColor, for: .normal)
        return btn
    }()
    
    var btnDarkTheme: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = AppData.currentTheme.btnBackground
        btn.tag = 2
        btn.setTitle("Dark Theme", for: .normal)
        btn.setTitleColor(AppData.currentTheme.fontColor, for: .normal)
        return btn
    }()
    
    var btnSepiaTheme: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = AppData.currentTheme.btnBackground
        btn.tag = 3
        btn.setTitle("Sepia Theme", for: .normal)
        btn.setTitleColor(AppData.currentTheme.fontColor, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppData.currentTheme.background
        addElements()
        setupConstraints()
        networkService.getUserAbout {[weak self] users in self?.userModels = users
            DispatchQueue.main.async{
                self?.setupData()}
        }
        addActionForButton()
    }
    
    private func addActionForButton() {
        btnLightTheme.addTarget(self, action: #selector(setTheme), for: .touchUpInside)
        btnDarkTheme.addTarget(self, action: #selector(setTheme), for: .touchUpInside)
        btnSepiaTheme.addTarget(self, action: #selector(setTheme), for: .touchUpInside)
    }
    
    private func addElements() {
        view.addSubview(photo)
        view.addSubview(userName)
        view.addSubview(titleSetChoice)
        view.addSubview(btnLightTheme)
        view.addSubview(btnDarkTheme)
        view.addSubview(btnSepiaTheme)
    }
    
    private func setupConstraints() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        titleSetChoice.translatesAutoresizingMaskIntoConstraints = false
        btnLightTheme.translatesAutoresizingMaskIntoConstraints = false
        btnDarkTheme.translatesAutoresizingMaskIntoConstraints = false
        btnSepiaTheme.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            photo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photo.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            photo.heightAnchor.constraint(equalTo: photo.widthAnchor),
            
            userName.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 20),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleSetChoice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleSetChoice.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            
            btnLightTheme.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnLightTheme.topAnchor.constraint(equalTo: titleSetChoice.bottomAnchor, constant: 10),
            btnLightTheme.widthAnchor.constraint(equalToConstant: 200),
            
            btnDarkTheme.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnDarkTheme.topAnchor.constraint(equalTo: btnLightTheme.bottomAnchor, constant: 5),
            btnDarkTheme.widthAnchor.constraint(equalToConstant: 200),
            
            btnSepiaTheme.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnSepiaTheme.topAnchor.constraint(equalTo: btnDarkTheme.bottomAnchor, constant: 5),
            btnSepiaTheme.widthAnchor.constraint(equalToConstant: 200),
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

extension ProfilePageView {
    @objc func setTheme(sender: UIButton) {
        switch sender.tag {
            case 1: AppData.setCurrentTheme(color: .light)
            case 2: AppData.setCurrentTheme(color: .dark)
            case 3: AppData.setCurrentTheme(color: .sepia)
        default:
            return
        }
        print("OK")
    }
}

#Preview {
    ProfilePageView()
}
