//
//  DatabaseManager.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI
import RealmSwift

class DatabaseManeger {
    @ObservedResults(DatabaseUsers.self) var users
    @ObservedResults(DatabasePosts.self) var posts
    
    static let databaseManager = DatabaseManeger()
    
    private init() { /* Singleton */ }
    
    private let realm = try! Realm()
    
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
    
    func printUsers() {
        print(realm.objects(DatabaseUsers.self))
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
    
    // MARK: ///
    
    func changePassword(for email: String, new password: String) {
        let user = findUser(by: email)
        
        try? realm.write {
            user.password = password
        }
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
    
    // MARK: FindFriends View
    
    func addFriend(userEmail: String, friendEmail: String) {
        let user = findUser(by: userEmail)
        let friend = findUser(by: friendEmail)
        
        try? realm.write {
            user.friends.append(friend.id)
            friend.friends.append(user.id)
        }
    }
    
    func makeFriend(reference: DatabaseUsers) -> DatabaseFriend {
        let friend = DatabaseFriend(id: reference.id,
                                    nickname: reference.nickname,
                                    email: reference.email,
                                    avatar: reference.avatar,
                                    latitude: reference.latitude,
                                    longitude: reference.longitude,
                                    friends: reference.friends,
                                    posts: reference.posts)
        return friend
    }
    
    func findFriends(email: String) -> [DatabaseFriend] {
        let user = findUser(by: email)
        var array = [DatabaseFriend]()
        
        for friend in user.friends {
            array.append(makeFriend(reference: findUser(by: friend)))
        }
        return array
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
            if user.email == userMain.email {
                arrayOfUsers.remove(at: index)
            }
            index += 1
        }
        
        index = 0
        for friend in arrayOfFriends {
            for user in arrayOfUsers {
                if user.email == friend.email {
                    arrayOfUsers.remove(at: index)
                }
                index += 1
            }
            index = 0
        }
        return arrayOfUsers
    }
}
