//
//  ChangePasswordViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 19.03.22.
//

import SwiftUI

class ChangePasswordViewModel: ObservableObject {
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    private var databaseManager = DatabaseManager.databaseManager
    
    @Published var firstPassword = ""
    @Published var secondPassword = ""
    
    func changePassword() {
        if firstPassword == secondPassword {
            databaseManager.changePassword(for: activeUserEmail, new: firstPassword)
        }
    }
}

