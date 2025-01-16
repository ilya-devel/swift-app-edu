//
//  NewsResponseModel.swift
//  homeMainSwiftUI
//
//  Created by Ильяс Альфатович on 16.01.2025.
//

struct NewsResponseModel: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [NewsModel]
}

struct NewsModel: Codable, Identifiable {
    var id: Int?
    var publicationDate: Double?
    var title: String?
    var slug: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case publicationDate = "publication_date"
        case title
        case slug
    }
}
