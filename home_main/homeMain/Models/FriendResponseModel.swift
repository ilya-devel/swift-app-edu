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
    var trackCode: String?
    var firstName: String?
    var lastName: String?
    var canAccessClosed: Bool?
    var isClosed: Bool?
    var onlineStatus: Int?
    var photoOrig: String?

    enum CodingKeys: String, CodingKey {
        case id
        case trackCode = "track_code"
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case onlineStatus = "online"
        case photoOrig = "photo_200_orig"
    }
}

struct FriendStorage: Codable {
    var friends: [FriendModel]?
}
