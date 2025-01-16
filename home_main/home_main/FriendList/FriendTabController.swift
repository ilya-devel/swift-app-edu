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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        tableView.register(FriendCell.self, forCellReuseIdentifier: "friend")
        networkService.getFriends {[weak self] friends in self?.models = friends
            DispatchQueue.main.async{
                self?.tableView.reloadData()
            }
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(showProfile))
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
}

#Preview() {
    FriendTabController()
}
