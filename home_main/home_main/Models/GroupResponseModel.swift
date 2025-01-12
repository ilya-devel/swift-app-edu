
//
//  FriendResponseModel.swift
//  home_main
//
//  Created by Ильяс Альфатович on 12.01.2025.
//

struct GroupResponseModel: Codable {
    var response: GroupResultModel
}

struct GroupResultModel: Codable {
    var count: Int
    var items: [GroupModel]?
}

struct GroupModel: Codable {
    var id: Int?
    var description: String?
    var name: String?
    var screen_name: String?
    var type: String?
    var is_closed: Int?
    var is_admin: Int?
    var is_member: Int?
    var is_advertiser: Int?
    var photo_50: String?
    var photo_100: String?
    var photo_200: String?
}
