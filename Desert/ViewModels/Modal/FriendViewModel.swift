//
//  FriendViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 12.03.22.
//

import SwiftUI

extension FriendsView {
    class FriendsViewModel: ObservableObject {
        @AppStorage("ActiveUserEmail") var activeUserEmail = ""
        private let databaseManager = DatabaseManager.databaseManager
        private let fileManager = FileManager()
        
        @Published var friends = [DatabaseFriend]()
        
        init() {
            DispatchQueue.main.async { [self] in
                friends = databaseManager.findFriends(email: activeUserEmail)
            }
        }
        
        func getAvatar(friend: DatabaseFriend) -> UIImage {
            var image = UIImage()
            do {
                image = try fileManager.readImage(with: databaseManager.findUser(by: friend.id).avatar ?? UUID())
            } catch let error {
                print(error.localizedDescription)
                image = UIImage(named: "photo")!
            }
            return image
        }
    }
}
