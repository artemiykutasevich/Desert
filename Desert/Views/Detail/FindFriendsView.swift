//
//  FindFriendsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 9.03.22.
//

import SwiftUI

struct FindFriendsView: View {
    @StateObject private var viewModel = FindFriendsViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.recomends) { user in
                    HStack {
                        Image("photo")
                            .resizable()
                            .imageCircleStyle()
                            .imageCircleStrokeStyle()
                        Spacer()
                        HStack {
                            Text(user.nickname)
                                .fontWeight(.bold)
                            Text("\(user.friends.count) friends")
                                .fontWeight(.light)
                        }
                        Spacer()
                        Button(action: {
                            viewModel.addFriends(friendEmail: user.email)
                            viewModel.updateRecommends()
                        }, label: {
                            Text("Add to friends")
                        })
                        .buttonStyle(width: 100)
                    }
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
