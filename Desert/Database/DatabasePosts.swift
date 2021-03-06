//
//  DatabasePosts.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import Foundation
import RealmSwift

class DatabasePosts: Object, Identifiable {
    @Persisted var id = UUID()
    @Persisted var userEmail: String
    
    @Persisted var publishedAt = Date()
    @Persisted var image: UUID // name of image in document directory
    @Persisted var comment: String
    
    @Persisted var likes = List<String>()
}
