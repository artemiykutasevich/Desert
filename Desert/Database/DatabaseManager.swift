//
//  DatabaseManager.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI
import RealmSwift

class DatabaseManager {
    @ObservedResults(DatabaseUsers.self) var users
    @ObservedResults(DatabasePosts.self) var posts
    
    static let databaseManager = DatabaseManager()
    
    private init() { /* Singleton */ }
    
    private let realm = try! Realm()
    
    // MARK: Find User
    
    func findUser(by email: String) -> DatabaseUsers {
        var realmUser = DatabaseUsers()
        
        for user in users {
            if user.email == email {
                realmUser = user
            }
        }
        return realmUser
    }
    
    func findUser(by id: UUID) -> DatabaseUsers {
        var realmUser = DatabaseUsers()
        
        for user in users {
            if user.id == id {
                realmUser = user
            }
        }
        return realmUser
    }
    
    func isUserCreated(user email: String) -> Bool {
        var answer = false
        
        for user in users {
            if user.email == email {
                answer = true
            }
        }
        return answer
    }
    
    // MARK: Registration View
    
    func addUser(nickname: String, email: String, password: String) {
        let user = DatabaseUsers()
        user.nickname = nickname
        user.email = email
        user.password = password
        
        try! realm.write {
            realm.add(user)
        }
    }
    
    // MARK: Forgot Password View
    
    func resetPassword(for email: String) {
        let user = findUser(by: email)
        
        try? realm.write {
            user.password = email
        }
    }
    
    // MARK: Authorization View
    
    func authorization(email: String, password: String) -> Bool {
        var answer = false
        
        for user in users {
            if user.email == email && user.password == password {
                answer = true
            }
        }
        return answer
    }
    
    // MARK: FindFriends View
    
    func addFriend(userEmail: String, friendID: UUID) {
        let user = findUser(by: userEmail)
        let friend = findUser(by: friendID)
        
        try? realm.write {
            user.friends.append(friend.id)
            friend.friends.append(user.id)
        }
    }
    
    func makeFriend(reference: DatabaseUsers) -> DatabaseFriend {
        let friend = DatabaseFriend(id: reference.id,
                                    nickname: reference.nickname,
                                    //email: reference.email,
                                    avatar: reference.avatar,
                                    latitude: reference.latitude,
                                    longitude: reference.longitude,
                                    friends: reference.friends,
                                    posts: reference.posts)
        return friend
    }
    
    func makeRecommends(userEmail: String) -> [DatabaseFriend] {
        let userMain = makeFriend(reference: findUser(by: userEmail))
        
        var arrayOfUsers = [DatabaseFriend]()
        for user in users {
            arrayOfUsers.append(makeFriend(reference: user))
        }
        
        let listOfUUIDFriends = userMain.friends
        
        var arrayOfFriends = [DatabaseFriend]()
        for friend in listOfUUIDFriends {
            arrayOfFriends.append(makeFriend(reference: findUser(by: friend)))
        }
        
        var index = 0
        for user in arrayOfUsers {
            if user.id == userMain.id {
                arrayOfUsers.remove(at: index)
            }
            index += 1
        }
        
        index = 0
        for friend in arrayOfFriends {
            for user in arrayOfUsers {
                if user.id == friend.id {
                    arrayOfUsers.remove(at: index)
                }
                index += 1
            }
            index = 0
        }
        return arrayOfUsers
    }
    
    // MARK: MyFriends View
    
    func findFriends(email: String) -> [DatabaseFriend] {
        let user = findUser(by: email)
        var array = [DatabaseFriend]()
        
        for friend in user.friends {
            array.append(makeFriend(reference: findUser(by: friend)))
        }
        return array
    }
    
    // MARK: MyFriends View
    
    func findUserPosts(userEmail: String) -> [DatabasePosts] {
        let user = findUser(by: userEmail)
        var postMain = [DatabasePosts]()
        
        if !user.posts.isEmpty {
            for post in user.posts {
                postMain.append(post)
            }
        }
        return postMain
    }
    
    // MARK: News View
    
    func findFriendsPosts(userEmail: String) -> [DatabasePosts] {
        let friends = findFriends(email: userEmail)
        var postsMain = [DatabasePosts]()
        
        for friend in friends {
            if !friend.posts.isEmpty {
                for post in friend.posts {
                    postsMain.append(post)
                }
            }
        }
        return postsMain
    }
    
    // MARK: Publications
    
    func addPublication(userEmail: String, image: UUID, comment: String) {
        let user = findUser(by: userEmail)
        
        let post = DatabasePosts()
        post.userEmail = userEmail
        post.image = image
        post.comment = comment
        
        try? realm.write {
            user.posts.append(post)
        }
    }
    
    func findPost(by postId: UUID) -> DatabasePosts {
        var result = DatabasePosts()
        
        for post in posts {
            if post.id == postId {
                result = post
            }
        }
        return result
    }
    
    func setLike(from userEmailMain: String, to post: UUID) {
        let postMain = findPost(by: post)
        let isLiked = isPostLiked(userEmail: userEmailMain, to: post)
        
        if isLiked {
            try? realm.write {
                var index = 0
                for like in postMain.likes {
                    if like == userEmailMain {
                        break
                    }
                    index += 1
                }
                postMain.likes.remove(at: index)
            }
        } else {
            try? realm.write {
                postMain.likes.append(userEmailMain)
            }
        }
    }
    
    func isPostLiked(userEmail: String, to post: UUID) -> Bool {
        let post = findPost(by: post)
        var result = false
        
        if post.likes.isEmpty {
            result = false
        } else {
            for user in post.likes {
                if user == userEmail {
                    result = true
                }
            }
        }
        return result
    }
    
    // MARK: Settings
    
    func changePassword(for email: String, new password: String) {
        let user = findUser(by: email)
        
        try? realm.write {
            user.password = password
        }
    }
    
    func changeNickname(for email: String, new nickname: String) {
        let user = findUser(by: email)
        
        try? realm.write {
            user.nickname = nickname
        }
    }
    
    // MARK: Location
    
    func addUserLocation(for email: String, latitude: Double, longitude: Double) {
        let user = findUser(by: email)
        
        try? realm.write {
            user.latitude = latitude
            user.longitude = longitude
        }
    }
    
    func printUsers() {
        print(users)
    }
    
    // MARK: Avatar
    
    func addAvatar(userEmail: String, image: UUID) {
        let user = findUser(by: userEmail)
        
        try? realm.write {
            user.avatar = image
        }
    }
}
