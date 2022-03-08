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
    }
}
