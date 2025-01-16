//
//  UserResponseModel.swift
//  home_main
//
//  Created by Ильяс Альфатович on 16.01.2025.
//

struct UserResponseModel: Codable {
    var response: [UserModel]
}

struct UserModel: Codable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var canAccessClosed: Bool?
    var isClosed: Bool?
    var photoOrig: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case photoOrig = "photo_max_orig"
    }
}
