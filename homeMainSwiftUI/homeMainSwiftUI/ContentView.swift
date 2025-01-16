//
//  ContentView.swift
//  homeMainSwiftUI
//
//  Created by Ильяс Альфатович on 16.01.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink("Click Me", destination: NewsView())
        }
    }
}

#Preview {
    ContentView()
}
