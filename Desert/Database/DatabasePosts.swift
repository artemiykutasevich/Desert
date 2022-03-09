//
//  DatabasePosts.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import Foundation
import RealmSwift

class DatabasePosts: Object, Identifiable {
    @Persisted var userEmail: String
    
    @Persisted var publishedAt = Date()
    @Persisted var image: String // url to image on device
    @Persisted var comment: String
    
    @Persisted var likes = List<String>()
}
