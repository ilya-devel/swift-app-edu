//
//  FriendTabController.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class FriendTabController: UITableViewController {
    private var networkService = NetworkService()
    private var models: [FriendModel] = []
    private var keyList = "friendsList"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModels()
        ColorsSchemeControll.addView(newView: self)
        view.backgroundColor = AppData.currentTheme.background
        title = "Friends"
        tableView.register(FriendCell.self, forCellReuseIdentifier: "friend")
        networkService.getFriends {[weak self] friends in self?.models = friends
            DispatchQueue.main.async{
                self?.tableView.reloadData()
            }
            self?.saveModels(friends: friends)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(showProfile))
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
    }
    
    private func loadModels() {
        if
            let data = UserDefaults.standard.value(forKey: keyList) as? Data,
            let friendLst = try? JSONDecoder().decode(FriendStorage.self, from: data) {
            models = friendLst.friends ?? []
        }
    }
    
    private func saveModels(friends: [FriendModel]) {
        let friendsLst = FriendStorage(friends: friends)
        if let data = try? JSONEncoder().encode(friendsLst) {
            UserDefaults.standard.set(data, forKey: keyList)
        }
    }
}

extension FriendTabController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend") as? FriendCell
        guard let cell = cell else {
            return UITableViewCell()
        }
        cell.setupAboutFriend(friend: models[indexPath.row])
        return cell
    }
}

private extension FriendTabController {
    @objc func showProfile() {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animation.type = .fade
        animation.duration = 1
        navigationController?.view.layer.add(animation, forKey: nil)
        navigationController?.pushViewController(ProfilePageView(), animated: false)
    }
    
    @objc func update() {
        networkService.getFriends {[weak self] friends in self?.models = friends
            DispatchQueue.main.async{
                self?.tableView.reloadData()
            }
            self?.saveModels(friends: friends)
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing()
            }
        }
    }
}

extension FriendTabController: ThemeViewDelegate {
    func updateColor() {
        view.backgroundColor = AppData.currentTheme.background
    }
}

//#Preview() {
//    FriendTabController()
//}
