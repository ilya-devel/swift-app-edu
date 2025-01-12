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
    var album_id: Int?
    var date: Int?
    var id: Int?
    var owner_id: Int?
    var web_view_token: String?
    var orig_photo: MetaPhotoModel
}

struct MetaPhotoModel: Codable {
    var height: Int?
    var type: String?
    var url: String?
    var width: Int?
}
