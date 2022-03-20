//
//  ChangeNicknameViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 19.03.22.
//

import SwiftUI

class ChangeNicknameViewModel: ObservableObject {
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    
    private var databaseManager = DatabaseManager.databaseManager
    
    @Published var nickname = ""
    
    func changeNickname() {
        databaseManager.changeNickname(for: activeUserEmail, new: nickname)
    }
}
