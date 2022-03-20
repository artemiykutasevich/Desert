//
//  AccountViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 11.03.22.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    
    private let databaseManager = DatabaseManager.databaseManager
    private let fileManager = FileManager()
    
    @Published var activeUser: DatabaseUsers?
    @Published var friends = [DatabaseFriend]()
    @Published var posts = [DatabasePosts]()
    
    @Published var showingPostsSheet = false
    @Published var showingFriendsSheet = false
    
    init() {
        DispatchQueue.main.async { [self] in
            activeUser = databaseManager.findUser(by: activeUserEmail)
            friends = databaseManager.findFriends(email: activeUserEmail)
            posts = databaseManager.findUserPosts(userEmail: activeUserEmail)
        }
    }
    
    func printActiveUser() {
        print(activeUser ?? "Active user - nil")
    }
    
    func getNickname() -> String {
        let nickname = "\(activeUser?.nickname ?? "nickname")"
        return nickname
    }
    
    func getLocation() -> String {
        let string = "\(activeUser?.latitude ?? 1.0), \(activeUser?.longitude ?? 1.0)"
        return string
    }
        
    func getAvatar(uuid: UUID) -> UIImage {
        var image = UIImage()
        do {
            image = try fileManager.readImage(with: uuid)
        } catch let error {
            print(error.localizedDescription)
            image = UIImage(named: "photo")!
        }
        return image
    }
}
