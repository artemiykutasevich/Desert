//
//  SettingsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

struct SettingsView: View {
    @State private var location = true
    @AppStorage("Animation") var animation = true

    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
//                // Future
//                Section("Account settings") {
//                    Label("Change avatar", systemImage: "person")
//                    Label("Change nickname", systemImage: "textformat.abc")
//                    Label("Change password", systemImage: "textformat.123")
//                }
//                .listRowBackground(Color("Color 4"))
//                .foregroundColor(.primary)
                
//                Section("Location") {
//                    HStack {
//                        Label("Location", systemImage: location ? "location" : "location.slash")
//                        Toggle("", isOn: $location)
//                    }
//                }
//                .listRowBackground(Color("Color 4"))
//                .foregroundColor(.primary)
                
                Section("Customization") {
                    HStack {
                        Label("Animations", systemImage: animation ? "play" : "pause")
                        Toggle("", isOn: $animation)
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
