//
//  NewsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                PostView()
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .safeAreaInset(edge: .bottom, content: {
                Color.clear.frame(height: 70)
            })
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
