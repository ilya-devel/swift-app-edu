//
//  GroupTabController.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class GroupTabController: UITableViewController {
    private var networkService = NetworkService()
    private var models: [GroupModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ColorsSchemeControll.addView(newView: self)
        view.backgroundColor = AppData.currentTheme.background
        title = "Groups"
//        tabBarItem.title = "Groups"
        tableView.register(GroupCell.self, forCellReuseIdentifier: "group")
        networkService.getGroups {[weak self] groups in self?.models = groups
            DispatchQueue.main.async{
                self?.tableView.reloadData()
            }
        }
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
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "group") as? GroupCell
            guard let cell = cell else {
                return UITableViewCell()
            }
            cell.setupAboutGroup(group: models[indexPath.row])
            return cell
    }
}

extension GroupTabController: ThemeViewDelegate {
    func updateColor() {
        view.backgroundColor = AppData.currentTheme.background
    }
}

#Preview() {
    GroupTabController()
}
