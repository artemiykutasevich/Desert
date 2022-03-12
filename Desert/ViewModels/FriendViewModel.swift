//
//  FriendViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 12.03.22.
//

import SwiftUI

extension FriendsView {
    @MainActor class FriendsViewModel: ObservableObject {
        @AppStorage("ActiveUserEmail") var activeUserEmail = ""
        let databaseManeger = DatabaseManeger.databaseManager
        
        @Published var friends: [DatabaseFriend]?
        
        init() {
            DispatchQueue.main.async { [self] in
                friends = databaseManeger.findFriends(email: activeUserEmail)
            }
        }
    }
}
