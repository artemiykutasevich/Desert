//
//  MyPostsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 11.03.22.
//

import SwiftUI

struct MyPostsView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    let fileManager = FileManager()
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.posts != [] {
                    ForEach(viewModel.posts) { post in
                        HStack {
                            Image(uiImage: try! fileManager.readImage(with: post.image))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                            Spacer()
                            VStack {
                                Text(post.comment)
                                Text("likes: \(post.likes.count)")
                            }
                            Spacer()
                        }
                    }
                    .listRowBackground(Color("Color 4"))
                    .foregroundColor(.primary)
                } else {
                    Text("Make publication to see posts")
                }
            }
            .background(Color("Color 4"))
            .navigationTitle("My Publications")
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostsView()
    }
}
