//
//  NewsViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 13.03.22.
//

import SwiftUI
import RealmSwift

class NewsViewModel: ObservableObject {
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    private let databaseManager = DatabaseManager.databaseManager
    
    var posts = [DatabasePosts]()
    
    init() {
        posts = databaseManager.findFriendsPosts(userEmail: activeUserEmail)
        posts = posts.sorted { $0.publishedAt > $1.publishedAt }
    }
}

