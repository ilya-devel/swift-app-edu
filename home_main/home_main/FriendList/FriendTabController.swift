//
//  FriendTabController.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class FriendTabController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
//        tabBarItem.title = "Friends"
        tableView.register(FriendCell.self, forCellReuseIdentifier: "cell")
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
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        FriendCell()
    }
}

#Preview() {
    FriendTabController()
}
