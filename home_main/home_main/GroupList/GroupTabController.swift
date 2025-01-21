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
    private var keyList = "groupList"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadModels()
        ColorsSchemeControll.addView(newView: self)
        view.backgroundColor = AppData.currentTheme.background
        title = "Groups"
        tableView.register(GroupCell.self, forCellReuseIdentifier: "group")
        networkService.getGroups {[weak self] groups in self?.models = groups
            self?.saveModels(groups: groups)
            DispatchQueue.main.async{
                self?.tableView.reloadData()
            }
        }
    }
    
    private func loadModels() {
        if
            let data = UserDefaults.standard.value(forKey: keyList) as? Data,
            let groupList = try? JSONDecoder().decode(GroupStorage.self, from: data) {
            models = groupList.groups ?? []
        }
    }
    
    private func saveModels(groups: [GroupModel]) {
        let groupsList = GroupStorage(groups: groups)
        if let data = try? JSONEncoder().encode(groupsList) {
            UserDefaults.standard.set(data, forKey: keyList)
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
