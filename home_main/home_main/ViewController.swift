//
//  ViewController.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

class ViewController: UIViewController {

    private var logo: UIImageView = {
            let logo = UIImageView(image: UIImage(systemName: "person"))
            return logo
        }()
        
        private var titlePage: UILabel = {
            let label = UILabel()
            label.text = "Авторизация"
            label.textAlignment = .center
            return label
        }()
        
        private var loginInput: UITextField = {
            let textInput = UITextField()
            textInput.placeholder = "Логин"
            textInput.borderStyle = .bezel
            return textInput
        }()
        
        private var pasInput: UITextField = {
            let textInput = UITextField()
            textInput.placeholder = "Пароль"
            textInput.borderStyle = .bezel
            return textInput
        }()
        
        private var btnEnter: UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .blue
            btn.setTitle("Войти", for: .normal)
            return btn
        }()
        

        override func viewDidLoad() {
            super.viewDidLoad()
            addElements()
            btnEnter.addTarget(self, action: #selector(tap), for: .touchUpInside)
            setConstrains()
        }
        
        func addElements() {
            view.addSubview(logo)
            view.addSubview(titlePage)
            view.addSubview(loginInput)
            view.addSubview(pasInput)
            view.addSubview(btnEnter)
        }

        func setConstrains() {
            logo.translatesAutoresizingMaskIntoConstraints = false
            titlePage.translatesAutoresizingMaskIntoConstraints = false
            loginInput.translatesAutoresizingMaskIntoConstraints = false
            pasInput.translatesAutoresizingMaskIntoConstraints = false
            btnEnter.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                logo.widthAnchor.constraint(equalToConstant: 200),
                logo.heightAnchor.constraint(equalToConstant: 200),
                
                titlePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titlePage.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 10),
                titlePage.widthAnchor.constraint(equalToConstant: 200),
                titlePage.heightAnchor.constraint(equalToConstant: 50),
                
                loginInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginInput.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 20),
                loginInput.widthAnchor.constraint(equalToConstant: 200),
                loginInput.heightAnchor.constraint(equalToConstant: 50),
                
                pasInput.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pasInput.topAnchor.constraint(equalTo: loginInput.bottomAnchor, constant: 10),
                pasInput.widthAnchor.constraint(equalToConstant: 200),
                pasInput.heightAnchor.constraint(equalToConstant: 50),
                
                btnEnter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                btnEnter.topAnchor.constraint(equalTo: pasInput.bottomAnchor, constant: 20),
                btnEnter.widthAnchor.constraint(equalToConstant: 200),
                btnEnter.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
        @objc private func tap() {
            let friend = UINavigationController(rootViewController: FriendTabController())
            let group = UINavigationController(rootViewController: GroupTabController())
            let photo = UINavigationController(rootViewController: PhotoViewController(collectionViewLayout: ColumnFlowLayout()))
            
            friend.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person"), tag: 0)
            
            group.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 0)
            
            photo.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo.stack"), tag: 0)

            
            let controllers = [friend, group, photo]
            
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = controllers
            guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let firstWindow = firstScene.windows.first else {return}
            
            firstWindow.rootViewController = tabBarController
        }
}

#Preview () {
    ViewController()
}
