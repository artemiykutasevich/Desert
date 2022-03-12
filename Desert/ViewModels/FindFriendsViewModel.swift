//
//  FindFriendsViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 11.03.22.
//

import SwiftUI
import RealmSwift

extension FindFriendsView {
    @MainActor class FindFriendsViewModel: ObservableObject {
        @AppStorage("ActiveUserEmail") var activeUserEmail = ""
        
        private let databaseManeger = DatabaseManeger.databaseManager
        @Published var recomends = [DatabaseFriend]()
        
        init() {
            DispatchQueue.main.async { [self] in
                recomends = databaseManeger.makeRecommends(userEmail: activeUserEmail)
            }
        }
        
        func updateRecommends() {
            recomends = []
            DispatchQueue.main.async { [self] in
                recomends = databaseManeger.makeRecommends(userEmail: activeUserEmail)
            }
        }
        
        func addFriends(friendEmail: String) {
            DispatchQueue.main.async { [self] in
                databaseManeger.addFriend(userEmail: activeUserEmail, friendEmail: friendEmail)
            }
        }
    }
}
