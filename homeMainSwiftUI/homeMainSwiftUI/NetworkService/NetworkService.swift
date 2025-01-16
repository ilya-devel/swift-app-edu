//
//  NetworkStatic.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    func getNews(completion: @escaping ([NewsModel]) -> Void) {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?lang=&fields=&expand=&order_by=&text_format=&ids=&location=&actual_only=true") else {return}
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let news = try JSONDecoder().decode(NewsResponseModel.self, from: data).results
                print("Friends List: ")
                print(news)
                completion(news)
                print("=====")
            } catch{
                print(error)
            }
        }.resume()
    }
}
