//
//  DatabaseFriend.swift
//  Desert
//
//  Created by Artem Kutasevich on 12.03.22.
//

import Foundation
import RealmSwift

class DatabaseFriend: Object, Identifiable {
    @Persisted var id: UUID
    @Persisted var nickname: String
    @Persisted var email: String
    
    @Persisted var avatar: String //url to image on device
    
    @Persisted var latitude = 0.0
    @Persisted var longitude = 0.0
    
    @Persisted var friends = List<UUID>()
    @Persisted var posts = List<DatabasePosts>()
    
    convenience init(id: UUID, nickname: String, email: String, avatar: String, latitude: Double, longitude: Double, friends: List<UUID>, posts: List<DatabasePosts>) {
        self.init()
        self.id = id
        self.nickname = nickname
        self.email = email
        self.avatar = avatar
        self.latitude = latitude
        self.longitude = longitude
        self.friends = friends
        self.posts = posts
    }
}
