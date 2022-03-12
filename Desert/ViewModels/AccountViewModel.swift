//
//  AccountViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 11.03.22.
//

import SwiftUI

extension AccountView {
    @MainActor class AccountViewModel: ObservableObject {
        @AppStorage("ActiveUserEmail") var activeUserEmail = ""
        
        private let databaseManager = DatabaseManeger.databaseManager
        @Published var activeUser: DatabaseUsers?
        
        @Published var showingPostsSheeet = false
        @Published var showingFriendsSheet = false
        
        init() {
            DispatchQueue.main.async { [self] in
                activeUser = databaseManager.findUser(by: activeUserEmail)
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
    }
}
