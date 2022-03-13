//
//  AccountView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color 4"))
    }
    
    // MARK: body
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    profile
                    
                    Button(action: {
                        viewModel.showingPostsSheeet.toggle()
                    }, label: {
                        HStack {
//                            posts
                            Spacer()
                            Text("My Posts")
                            Spacer()
                        }
                    })
                    .sheet(isPresented: $viewModel.showingPostsSheeet) {
                        PostsView()
                    }
                    
                    Button(action: {
                        viewModel.showingFriendsSheet.toggle()
                    }, label: {
                        HStack {
//                            friends
                            Spacer()
                            Text("My Friends")
                            Spacer()
                        }
                    })
                    .sheet(isPresented: $viewModel.showingFriendsSheet) {
                        FriendsView()
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
            .foregroundColor(.primary)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(NavigationBar(title: "Account"))
        }
    }
    
    // MARK: profile
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .font(.largeTitle)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.green, Color("Color 4"))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    BlobView()
                        .offset(x: 130, y: 50)
                        .scaleEffect(0.9)
                )
                .background(
                    BlobView2()
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
            Image(systemName: "person")
                .resizable()
                .imageCircleStyle()
                .imageCircleStrokeStyle(strokeSize: 3)
                .scaleEffect(0.8)
            
            Image(systemName: "person")
                .resizable()
                .imageCircleStyle()
                .imageCircleStrokeStyle(strokeSize: 3)
                .scaleEffect(0.8)
                .offset(x: 50)
            
            Image(systemName: "person")
                .resizable()
                .imageCircleStyle()
                .imageCircleStrokeStyle(strokeSize: 3)
                .scaleEffect(0.9)
                .offset(x: 25)
        }
    }
    
    // MARK: posts
    
    var posts: some View {
        ZStack {
            Image(systemName: "photo")
                .resizable()
                .imageRoundedRectangleStyle()
                .imageRoundedRectangleStrokeStyle(strokeSize: 3)
                .scaleEffect(0.8)
            
            Image(systemName: "photo")
                .resizable()
                .imageRoundedRectangleStyle()
                .imageRoundedRectangleStrokeStyle(strokeSize: 3)
                .scaleEffect(0.8)
                .offset(x: 50)
            
            Image(systemName: "photo")
                .resizable()
                .imageRoundedRectangleStyle()
                .imageRoundedRectangleStrokeStyle(strokeSize: 3)
                .scaleEffect(0.9)
                .offset(x: 25)
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
