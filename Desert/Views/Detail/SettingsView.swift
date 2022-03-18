//
//  SettingsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                Section("Account settings") {
                    NavigationLink(destination: ChangeAvatarView()) {
                        Label("Change avatar", systemImage: "person")
                    }
                    Label("Change nickname", systemImage: "textformat.abc")
                    Label("Change password", systemImage: "textformat.123")
                    Toggle(isOn: $viewModel.location) {
                        Label("Show my location", systemImage: viewModel.location ? "play" : "pause")
                    }
                }
                .listRowBackground(Color("Color 4"))
                .foregroundColor(.primary)
                
                Section("Customization") {
                    Toggle(isOn: $viewModel.animation) {
                        Label("Animations", systemImage: viewModel.animation ? "play" : "pause")
                    }
                }
                .listRowBackground(Color("Color 4"))
                .foregroundColor(.primary)
                
                Section("About author") {
                    Link(destination: URL(string: "https://github.com/artemiykutasevich")!) {
                        Label("GitHub", image: "github")
                    }
                    Link(destination: URL(string: "https://www.linkedin.com/in/artemiykutasevich")!) {
                        Label("LinkedIn", image: "linkedin")
                    }
                    Link(destination: URL(string: "https://t.me/artemiykutasevich")!) {
                        Label("Telegram", image: "telegram")
                    }
                }
                .listRowBackground(Color("Color 4"))
                .foregroundColor(.primary)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
