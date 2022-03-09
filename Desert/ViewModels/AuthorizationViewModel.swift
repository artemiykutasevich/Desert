//
//  AuthorizationViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

extension AuthorizationView {
    @MainActor class AuthorizationViewModel: ObservableObject {
        
        @AppStorage("ActiveUserEmail") var activeUserEmail = ""
        
        @Published var email = ""
        @Published var password = ""
        
        @Published var showingAlert = false
        
        private let databaseManager = DatabaseManeger.databaseManager
        
        func printAllUsers() {
            databaseManager.printUsers()
        }
        
        func authorization() -> Bool {
            return databaseManager.authorization(email: email, password: password)
        }
        
        func buttonAction() {
            if authorization() == true {
                email = email
            } else {
                showingAlert = true
            }
        }
    }
}
