//
//  ForgotPasswordViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import Foundation

extension ForgotPasswordView {
    @MainActor class ForgotPasswordViewModel: ObservableObject {
        @Published var email = ""
        
        @Published var showingAlert = false
        
        private let databaseManager = DatabaseManeger.databaseManager
        
        func resetPassword() {
            databaseManager.resetPassword(for: email)
        }
    }
}
