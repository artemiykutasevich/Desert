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
        
        private let databaseManager = DatabaseManager.databaseManager
        
        func authorization() -> Bool {
            return databaseManager.authorization(email: email, password: password)
        }
        
        func buttonAction() {
            if authorization() == true {
                activeUserEmail = email
            } else {
                showingAlert = true
            }
        }
    }
}
