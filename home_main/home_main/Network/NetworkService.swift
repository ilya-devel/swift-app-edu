//
//  NetworkStatic.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getFriends() {
        let url = URL(string: "https://api.vk.com/method/friends.get?count=10&fields=first_name,last_name,is_closed&access_token=\(NetworkService.token)&v=5.199%20HTTP/1.1")
        
        guard let url else {return}
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let friends = try JSONDecoder().decode(FriendResponseModel.self, from: data)
                print("Friends List: ")
                print(friends.response.items ?? "Friends List is empty")
                print("=====")
            } catch{
                print(error)
            }
        }.resume()
    }
    
    func getGroups() {
        let url = URL(string: "https://api.vk.com/method/groups.get?&count=10&fields=description&access_token=\(NetworkService.token)&v=5.199%20HTTP/1.1&extended=1")
        
        guard let url else {return}
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let groups = try JSONDecoder().decode(GroupResponseModel.self, from: data)
                print("Groups List: ")
                print(groups.response.items ?? "Groups List is empty")
                print("=====")
            } catch{
                print(error)
            }
        }.resume()
    }
    
    func getPhotos() {
        let url = URL(string: "https://api.vk.com/method/photos.get?&count=10&access_token=\(NetworkService.token)&v=5.199%20HTTP/1.1&extended=1&album_id=saved")
        
        guard let url else {return}
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotoResponseModel.self, from: data)
                print("Photos List: ")
                print(photos.response.items ?? "Photos List is empty")
                print("=====")
            } catch{
                print(error)
            }
        }.resume()
    }
}
