//
//  FindFriendsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 9.03.22.
//

import SwiftUI

struct FindFriendsView: View {
    
    @State var text = ""
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                TextField("find friends", text: $text)
                
                Section {
                    Text("fjfj")
                    Text("fjfjf")
                }
            }
            .navigationTitle("Find Friends")
        }
    }
}

struct FindFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FindFriendsView()
    }
}
