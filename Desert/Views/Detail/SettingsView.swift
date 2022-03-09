//
//  SettingsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

struct SettingsView: View {
    @State private var location = true
    
    @State private var animation = true
    @State private var glassEffect = true

    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                Section("Location") {
                    HStack {
                        Label("Location", systemImage: location ? "location" : "location.slash")
                        Toggle("", isOn: $location)
                    }
                }
                .listRowBackground(Color("Color 4"))
                .foregroundColor(.black)
                
                Section("Customization") {
                    HStack {
                        Label("Animations", systemImage: animation ? "play" : "pause")
                        Toggle("", isOn: $animation)
                    }
                    HStack {
                        Label("Glass Effect", systemImage: glassEffect ? "play" : "pause")
                        Toggle("", isOn: $glassEffect)
                    }
                }
                .listRowBackground(Color("Color 4"))
                .listRowSeparatorTint(.black)
                .foregroundColor(.black)
                
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
                .listRowSeparatorTint(.black)
                .foregroundColor(.black)
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
