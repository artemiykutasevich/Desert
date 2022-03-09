//
//  DatabaseManager.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import Foundation
import RealmSwift

class DatabaseManeger {    
    static let databaseManager = DatabaseManeger()
    
    private init() { /* Singleton */ }
    
    private let realm = try! Realm()
    
    func findUser(by email: String) -> DatabaseUsers {
        let users = realm.objects(DatabaseUsers.self)
        var realmUser = DatabaseUsers()
        
        for user in users {
            if user.email == email {
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
        let users = realm.objects(DatabaseUsers.self)
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
        let users = realm.objects(DatabaseUsers.self)
        var answer = false
        
        for user in users {
            if user.email == email {
                answer = true
            }
        }
        return answer
    }
}
