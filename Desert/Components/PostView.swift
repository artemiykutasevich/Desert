//
//  PostView.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

struct PostView: View {
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    var post: DatabasePosts
    
    private let databaseManager = DatabaseManager.databaseManager
    private let fileManager = FileManager()
    
    @State var isLiked = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("photo")
                    .resizable()
                    .imageCircleStyle(diameter: 70)
                Spacer()
                Text("\(post.userEmail)")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            Image(uiImage: try! fileManager.readImage(with: post.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                Spacer()
                Text(post.publishedAt.formatted(date: .abbreviated, time: .shortened))
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: {
                    isLiked.toggle()
                    databaseManager.setLike(from: activeUserEmail, to: post.id)
                }, label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.largeTitle)
                    Text("\(post.likes.count)")
                })
                .foregroundColor(.red)
                .shadow(color: .red, radius: 4, y: 3)
                .padding(.trailing)
            }
            .padding(.top)
            .padding(.bottom)
            
            Text(post.comment)
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(25)
        .shadow(color: .primary.opacity(0.3), radius: 5, x: 0, y: 5)
        .padding()
        .onAppear {
            isLiked = databaseManager.isPostLiked(userEmail: activeUserEmail, to: post.id)
        }
    }
}
