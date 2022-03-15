//
//  PostsViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 13.03.22.
//

import SwiftUI

extension PostsView {
    @MainActor class PostsViewModel: ObservableObject {
        @AppStorage("ActiveUserEmail") var activeUserEmail = ""
        private let databaseManager = DatabaseManager.databaseManager
        
        var posts = [DatabasePosts]()
        
        init() {
            posts = databaseManager.findUserPosts(userEmail: activeUserEmail)
        }
    }
}
