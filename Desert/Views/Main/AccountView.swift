//
//  AccountView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    // MARK: body
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    profile
                    
                    Button(action: {
                        viewModel.showingPostsSheet.toggle()
                        viewModel.printActiveUser()
                    }, label: {
                        HStack {
                            posts
                            Spacer()
                            Text("My Posts")
                            Spacer()
                        }
                    })
                    .sheet(isPresented: $viewModel.showingPostsSheet) {
                        MyPostsView()
                    }
                    
                    Button(action: {
                        viewModel.showingFriendsSheet.toggle()
                    }, label: {
                        HStack {
                            friends
                            Spacer()
                            Text("My Friends")
                            Spacer()
                        }
                    })
                    .sheet(isPresented: $viewModel.showingFriendsSheet) {
                        MyFriendsView()
                    }
                }
                
                Section {
                    NavigationLink(destination: FindFriendsView()) {
                        Label("Find Friend", systemImage: "person")
                    }
                }
                .listRowBackground(Color("Color 4"))
                .foregroundColor(.primary)
                
                Section {
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gear")
                    }
                }
                .listRowBackground(Color("Color 4"))
                .foregroundColor(.primary)
                
                Section {
                    Button(action: {
                        viewModel.activeUserEmail = ""
                    }, label: {
                        Label("Exit", systemImage: "xmark.app")
                    })
                }
                .listRowBackground(Color(.red).opacity(0.3))
            }
            .background(Color("Color 4"))
            .foregroundColor(.primary)
            .navigationBarHidden(true)
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(NavigationBar(title: "Account"))
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 50)
            }
        }
    }
    
    // MARK: profile
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(uiImage: viewModel.getAvatar(uuid: viewModel.activeUser?.avatar ?? UUID()))
                .resizable()
                .imageCircleStyle(diameter: 100)
                .imageCircleStrokeStyle()
                .background(
                    FirstBlobView()
                        .offset(x: 130, y: 50)
                        .scaleEffect(0.9)
                )
                .background(
                    SecondBlobView2()
                        .offset(x: -270, y: 60)
                        .scaleEffect(0.7)
                )
            Text(viewModel.getNickname())
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            HStack {
                Image(systemName: "location")
                Text(viewModel.getLocation())
            }
            .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    // MARK: friends
    
    var friends: some View {
        ZStack {
            if viewModel.friends.count >= 1 {
                let image = viewModel.getAvatar(uuid: viewModel.friends[0].avatar ?? UUID())
                Image(uiImage: image)
                    .resizable()
                    .imageCircleStyle()
                    .imageCircleStrokeStyle(strokeSize: 3)
                    .scaleEffect(0.9)
                    .offset(x: 25)
            }
            
            if viewModel.friends.count >= 2 {
                let image = viewModel.getAvatar(uuid: viewModel.friends[1].avatar ?? UUID())
                Image(uiImage: image)
                    .resizable()
                    .imageCircleStyle()
                    .imageCircleStrokeStyle(strokeSize: 3)
                    .scaleEffect(0.8)
            }
            
            if viewModel.friends.count >= 3 {
                let image = viewModel.getAvatar(uuid: viewModel.friends[2].avatar ?? UUID())
                Image(uiImage: image)
                    .resizable()
                    .imageCircleStyle()
                    .imageCircleStrokeStyle(strokeSize: 3)
                    .scaleEffect(0.8)
                    .offset(x: 50)
            }
        }
    }
    
    // MARK: posts
    
    var posts: some View {
        ZStack {
            if viewModel.posts.count >= 1 {
                let image = viewModel.getAvatar(uuid: viewModel.posts[0].image)
                Image(uiImage: image)
                    .resizable()
                    .imageRoundedRectangleStyle()
                    .imageRoundedRectangleStrokeStyle(strokeSize: 3)
                    .scaleEffect(0.9)
                    .offset(x: 25)
            }
            
            if viewModel.posts.count >= 2 {
                let image = viewModel.getAvatar(uuid: viewModel.posts[1].image)
                Image(uiImage: image)
                    .resizable()
                    .imageRoundedRectangleStyle()
                    .imageRoundedRectangleStrokeStyle(strokeSize: 3)
                    .scaleEffect(0.8)
            }
            
            if viewModel.posts.count >= 3 {
                let image = viewModel.getAvatar(uuid: viewModel.posts[2].image)
                Image(uiImage: image)
                    .resizable()
                    .imageRoundedRectangleStyle()
                    .imageRoundedRectangleStrokeStyle(strokeSize: 3)
                    .scaleEffect(0.8)
                    .offset(x: 50)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountView()
            AccountView()
                .preferredColorScheme(.dark)
        }
    }
}
