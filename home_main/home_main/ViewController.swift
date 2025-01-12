//
//  ViewController.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit
@preconcurrency import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    }()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(webView)
            
            let myURL = URL(string: "https://oauth.vk.com/authorize?client_id=\(AppData.appID)&redirect_uri=https://oauth.vk.com/blank.html&scope=friends,groups,photos&display=mobile&response_type=token")
            webView.load(URLRequest(url: myURL!))
        }
        
        
        private func tap() {
            let friend = UINavigationController(rootViewController: FriendTabController())
            let group = UINavigationController(rootViewController: GroupTabController())
            let photo = UINavigationController(rootViewController: PhotoViewController(collectionViewLayout: ColumnFlowLayout()))
            
            friend.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person"), tag: 0)
            
            group.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 0)
            
            photo.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo.stack"), tag: 0)

            
            let controllers = [friend, group, photo]
            
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = controllers
            guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let firstWindow = firstScene.windows.first else {return}
            
            firstWindow.rootViewController = tabBarController
        }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        NetworkService.token = params["access_token"]!
        NetworkService.userID = params["user_id"]!
        print("Token: " + NetworkService.token)
        print("-----")
        print("UserID: " + NetworkService.userID)
        print("")
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        tap()
    }
}

#Preview () {
    ViewController()
}
