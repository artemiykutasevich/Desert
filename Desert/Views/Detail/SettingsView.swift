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
                    Button(action: {
                        viewModel.showingChangeAvatarSheet.toggle()
                    }, label: {
                        Label("Change avatar", systemImage: "person")
                    })
                    .sheet(isPresented: $viewModel.showingChangeAvatarSheet) {
                        ChangeAvatarView()
                    }
                    
                    Button(action: {
                        viewModel.showingChangeNicknameSheet.toggle()
                    }, label: {
                        Label("Change nickname", systemImage: "textformat.abc")
                    })
                    .sheet(isPresented: $viewModel.showingChangeNicknameSheet) {
                        ChangeNicknameView()
                    }
                    
                    Button(action: {
                        viewModel.showingChangePasswordSheet.toggle()
                    }, label: {
                        Label("Change password", systemImage: "textformat.123")
                    })
                    .sheet(isPresented: $viewModel.showingChangePasswordSheet) {
                        ChangePasswordView()
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
            .background(Color("Color 1"))
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
