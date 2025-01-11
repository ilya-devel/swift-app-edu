//
//  GroupTabController.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class GroupTabController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
//        tabBarItem.title = "Groups"
        tableView.register(GroupCell.self, forCellReuseIdentifier: "cell")
    }
}

extension GroupTabController {
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
        GroupCell()
    }
}

#Preview() {
    GroupTabController()
}
