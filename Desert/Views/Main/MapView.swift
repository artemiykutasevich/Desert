//
//  MapView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI
import MapKit
import RealmSwift

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.friends) { friend in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: friend.latitude, longitude: friend.longitude)) {
                    FriendMapAnnotation(avatar: viewModel.getAvatar(userID: friend.id))
                }
            }
            .ignoresSafeArea()
            .navigationTitle("Map")
            .navigationBarHidden(true)
            .onAppear {
                viewModel.checkIfLocationManagerEnabled()
            }
        }
        .overlay(NavigationBar(title: "Map"))
        .onAppear {
            viewModel.setFriends()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
