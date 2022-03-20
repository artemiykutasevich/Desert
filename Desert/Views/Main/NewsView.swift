//
//  NewsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct NewsView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                if viewModel.posts != [] {
                    ForEach(viewModel.posts) { post in
                        PostView(post: post)
                    }
                } else {
                    Text("Find friends to see they posts")
                }
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(
                NavigationBar(title: "News")
            )
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
