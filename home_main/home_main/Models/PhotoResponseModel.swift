//
//  FriendResponseModel.swift
//  home_main
//
//  Created by Ильяс Альфатович on 12.01.2025.
//

struct PhotoResponseModel: Codable {
    var response: PhotoResultModel
}

struct PhotoResultModel: Codable {
    var count: Int
    var items: [PhotoModel]?
}

struct PhotoModel: Codable {
    var albumId: Int?
    var date: Int?
    var id: Int?
    var ownerId: Int?
    var webViewToken: String?
    var origPhoto: MetaPhotoModel
    
    enum CodingKeys: String, CodingKey {
        case albumId = "album_id"
        case date
        case id
        case ownerId = "owner_id"
        case webViewToken = "web_view_token"
        case origPhoto = "orig_photo"
    }
}

struct MetaPhotoModel: Codable {
    var height: Int?
    var type: String?
    var url: String?
    var width: Int?
}
