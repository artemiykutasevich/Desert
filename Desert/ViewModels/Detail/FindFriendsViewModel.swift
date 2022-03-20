//
//  FindFriendsViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 11.03.22.
//

import SwiftUI
import RealmSwift

class FindFriendsViewModel: ObservableObject {
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    
    private let databaseManager = DatabaseManager.databaseManager
    private let fileManager = FileManager()
    @Published var recommends = [DatabaseFriend]()
    
    init() {
        DispatchQueue.main.async { [self] in
            recommends = databaseManager.makeRecommends(userEmail: activeUserEmail)
        }
    }
    
    func updateRecommends() {
        recommends = []
        DispatchQueue.main.async { [self] in
            recommends = databaseManager.makeRecommends(userEmail: activeUserEmail)
        }
    }
    
    func addFriends(friendEmail: String) {
        DispatchQueue.main.async { [self] in
            databaseManager.addFriend(userEmail: activeUserEmail, friendEmail: friendEmail)
        }
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
