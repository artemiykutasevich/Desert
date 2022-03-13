//
//  RegistrationViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

extension RegistrationView {
    @MainActor class RegistrationViewModel: ObservableObject {
        @Published var nickname = ""
        @Published var email = ""
        @Published var firstPassword = ""
        @Published var secondPassword = ""
        
        @Published var showingAlert = false
        
        private let databaseManager = DatabaseManager.databaseManager
        
        func registrationUser() {
            databaseManager.addUser(nickname: nickname, email: email, password: firstPassword)
            nickname = ""
            email = ""
            firstPassword = ""
            secondPassword = ""
        }
    }
}
