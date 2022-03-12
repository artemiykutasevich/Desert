//
//  DatabaseUsers.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import Foundation
import RealmSwift

class DatabaseUsers: Object, Identifiable {
    @Persisted var id = UUID()
    @Persisted var nickname: String
    @Persisted var email: String
    @Persisted var password: String
    
    @Persisted var avatar: String //url to image on device
    
    @Persisted var latitude = 0.0
    @Persisted var longitude = 0.0
    
    @Persisted var friends = List<UUID>()
    @Persisted var posts = List<DatabasePosts>()
}
