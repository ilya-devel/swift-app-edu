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
    var groupName: String?
    var screenName: String?
    var type: String?
    var isClosed: Int?
    var isAdmin: Int?
    var isMember: Int?
    var isAdvertiser: Int?
    var photo50: String?
    var photo100: String?
    var photo200: String?

    enum CodingKeys: String, CodingKey {
        case id
        case description
        case groupName = "name"
        case screenName = "screen_name"
        case type
        case isClosed = "is_closed"
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}

struct GroupStorage: Codable {
    var groups: [GroupModel]?
}
