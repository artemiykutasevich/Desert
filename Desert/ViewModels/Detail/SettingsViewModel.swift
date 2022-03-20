//
//  SettingsViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 18.03.22.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @AppStorage("Animation") var animation = true
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    
    @Published var showingChangeAvatarSheet = false
    @Published var showingChangeNicknameSheet = false
    @Published var showingChangePasswordSheet = false
}
