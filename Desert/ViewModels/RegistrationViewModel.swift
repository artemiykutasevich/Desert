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
    }
}
