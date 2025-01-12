//
//  FriendResponseModel.swift
//  home_main
//
//  Created by Ильяс Альфатович on 12.01.2025.
//

struct FriendResponseModel: Codable {
    var response: FriendResultModel
}

struct FriendResultModel: Codable {
    var count: Int
    var items: [FriendModel]?
}

struct FriendModel: Codable {
    var id: Int?
    var track_code: String?
    var first_name: String?
    var last_name: String?
    var can_access_closed: Bool?
    var is_closed: Bool?
}
