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
    
    func getFriends(completion: @escaping ([FriendModel]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?count=10&fields=first_name,last_name,is_closed,online,photo_200_orig&access_token=\(NetworkService.token)&v=5.199%20HTTP/1.1") else {return}
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let friends = try JSONDecoder().decode(FriendResponseModel.self, from: data).response.items
                print("Friends List: ")
                print(friends ?? "Friends List is empty")
                completion(friends ?? [])
                print("=====")
            } catch{
                print(error)
            }
        }.resume()
    }
    
    func getGroups(completion: @escaping ([GroupModel]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?&count=10&fields=description&access_token=\(NetworkService.token)&v=5.199%20HTTP/1.1&extended=1") else {return}
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let groups = try JSONDecoder().decode(GroupResponseModel.self, from: data).response.items
                print("Groups List: ")
                completion(groups ?? [])
                print(groups ?? "Groups List is empty")
                print("=====")
            } catch{
                print(error)
            }
        }.resume()
    }
    
    func getPhotos(completion: @escaping ([PhotoModel]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?&count=10&access_token=\(NetworkService.token)&v=5.199%20HTTP/1.1&extended=1&album_id=saved") else {return}
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotoResponseModel.self, from: data).response.items
                print("Photos List: ")
                print(photos ?? "Photos List is empty")
                completion(photos ?? [])
                print("=====")
            } catch{
                print(error)
            }
        }.resume()
    }
    
    func getUserAbout(completion: @escaping ([UserModel]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/users.get?access_token=\(NetworkService.token)&v=5.199%20HTTP/1.1&fields=photo_max_orig") else {return}
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let users = try JSONDecoder().decode(UserResponseModel.self, from: data).response
                print("Users List: ")
                print(users)
                completion(users)
                print("=====")
            } catch{
                print(error)
            }
        }.resume()
    }
}
