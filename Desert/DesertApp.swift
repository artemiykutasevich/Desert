//
//  DesertApp.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

@main
struct DesertApp: App {
    
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    
    var body: some Scene {
        WindowGroup {
            if activeUserEmail == "" {
                AuthorizationView()
            } else {
                ContentView()
            }
        }
    }
}
