//
//  AccountView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    
    @State var showingSheet = false
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color("Color 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                profile
                    .contextMenu {
                        VStack {
                            Button(action: {
                                print("person")
                            }, label: {
                                HStack {
                                    Text("Change avatar")
                                    Image(systemName: "person")
                                }
                            })
                            Button(action: {
                                print("nickname")
                            }, label: {
                                HStack {
                                    Text("Change nickname")
                                    Image(systemName: "textformat.abc")
                                }
                            })
                            Button(action: {
                                print("password")
                            }, label: {
                                HStack {
                                    Text("Change password")
                                    Image(systemName: "textformat.123")
                                }
                            })
                        }
                    }
                
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    HStack {
                        friends
                        Spacer()
                        Text("My Friends")
                    }
                })
                .sheet(isPresented: $showingSheet) {
                    FriendsView()
                }
                
//                // Version 1.1
//                Section {
//                    NavigationLink(destination: PlacesView()) {
//                        Text("My places")
//                    }
//                }
                 
                Section {
                    NavigationLink(destination: FindFriendsView()) {
                        Label("Find Friends", systemImage: "person")
                    }
                }
                
                Section {
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gear")
                    }
                }
                
                Section {
                    Button(action: {
                        activeUserEmail = ""
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
            .safeAreaInset(edge: .bottom, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(NavigationBar(title: "Account"))
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .font(.largeTitle)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.green, Color("Color 1"))
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
            Text("Nickname")
                .font(.title)
                .fontWeight(.semibold)
            HStack {
                Image(systemName: "location")
                Text("Belarus")
            }
            .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var friends: some View {
        ZStack {
            Image("photo")
                .font(.largeTitle)
                .clipShape(Circle())
                .scaleEffect(0.3)
                .frame(width: 30, height: 30)
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
            
            Image("photo")
                .font(.largeTitle)
                .clipShape(Circle())
                .scaleEffect(0.3)
                .frame(width: 30, height: 30)
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .offset(x: 30)
            
            Image("photo")
                .font(.largeTitle)
                .clipShape(Circle())
                .scaleEffect(0.3)
                .frame(width: 30, height: 30)
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .offset(x: 60)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountView()
        }
    }
}
