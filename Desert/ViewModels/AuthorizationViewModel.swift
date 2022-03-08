//
//  AuthorizationViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import Foundation

extension AuthorizationView {
    @MainActor class AuthorizationViewModel: ObservableObject {
        @Published var email = ""
        @Published var password = ""
    }
}
