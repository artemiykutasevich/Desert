//
//  Tab.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "News", icon: "newspaper", tab: .news, color: Color("Color 2")),
    TabItem(text: "Map", icon: "map", tab: .map, color: Color("Color 3")),
    TabItem(text: "Account", icon: "person", tab: .account, color: Color("Color 4"))
]

enum Tab: String {
    case news
    case map
    case account
}
