//
//  RegistrationViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import Foundation

extension RegistrationView {
    @MainActor class RegistrationViewModel: ObservableObject {
        @Published var nickname = ""
        @Published var email = ""
        @Published var firstPassword = ""
        @Published var secondPassword = ""
        
        @Published var showingAlert = false
        
        private let databaseManager = DatabaseManeger.databaseManager
        
        func registrationUser() {
            databaseManager.addUser(nickname: nickname, email: email, password: firstPassword)
        }
        
        func printAllUsers() {
            databaseManager.printUsers()
        }
    }
}
