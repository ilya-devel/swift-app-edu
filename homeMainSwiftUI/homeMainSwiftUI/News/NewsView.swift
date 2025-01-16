//
//  NewsView.swift
//  homeMainSwiftUI
//
//  Created by Ильяс Альфатович on 16.01.2025.
//

import SwiftUI

struct NewsView: View {
    @State var news: [NewsModel] = []
    private var networkService = NetworkService()
    
    var body: some View {
        VStack {
            Label("News", systemImage: "newspaper")
                .padding()
            List(news) {news in VStack{
                Text(Helper.getDate(date: news.publicationDate!))
                    .font(.body)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
                Text(news.title!)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
//                Text("25 сентября 1988")
//                    .font(.body)
//                    .fontWeight(.thin)
//                    .multilineTextAlignment(.leading)
//                    
//                    
//                Text("Сегодня произошло странное происшествие")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .multilineTextAlignment(.leading)
            }}.onAppear {
                networkService.getNews {
                    (news) in self.news = news
                }
            }
        }
    }
}

#Preview {
    NewsView()
}
