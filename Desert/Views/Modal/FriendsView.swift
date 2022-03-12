//
//  FriendsView.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

struct FriendsView: View {
    @StateObject var viewModel = FriendsViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.friends ?? []) { friend in
                    HStack {
                        Image("photo")
                            .resizable()
                            .imageCircleStyle()
                            .imageCircleStrokeStyle()
                        Spacer()
                        VStack {
                            Text(friend.nickname)
                                .fontWeight(.bold)
                            Text("\(friend.friends.count) friend")
                                .fontWeight(.light)
                        }
                        Spacer()
                    }
                }
            }
            .navigationTitle("My Friends")
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
