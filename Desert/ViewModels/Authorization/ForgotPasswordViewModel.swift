//
//  ForgotPasswordViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

extension ForgotPasswordView {
    class ForgotPasswordViewModel: ObservableObject {
        @Published var email = ""
        
        @Published var showingAlert = false
        
        private let databaseManager = DatabaseManager.databaseManager
        
        func resetPassword() {
            DispatchQueue.main.async { [self] in
                databaseManager.resetPassword(for: email)
            }
            email = ""
        }
    }
}
