//
//  PostsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 11.03.22.
//

import SwiftUI

struct PostsView: View {
    @StateObject private var viewModel = PostsViewModel()
    
    let filemanager = FileManager()
    
    var body: some View {
        NavigationView {
            List {
                if viewModel.posts != [] {
                    ForEach(viewModel.posts) { post in
                        HStack {
                            Image(uiImage: try! filemanager.readImage(with: post.image))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                            Spacer()
                            Text(post.comment)
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
        PostsView()
    }
}
