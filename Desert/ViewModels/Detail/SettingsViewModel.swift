//
//  SettingsViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 18.03.22.
//

import SwiftUI

extension SettingsView {
    class SettingsViewModel: ObservableObject {
        @AppStorage("Animation") var animation = true
        
        @Published var location = true
    }
}
