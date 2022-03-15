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
    
//    let annotations = [
//        Place(nickname: "stas", coordinate: CLLocationCoordinate2D(
//            latitude: 37.807920,
//            longitude: -122.422949)),
//        Place(nickname: "oleg", coordinate: CLLocationCoordinate2D(
//            latitude: 37.804920,
//            longitude: -122.2949)),
//        Place(nickname: "nik", coordinate: CLLocationCoordinate2D(
//            latitude: 37.8920,
//            longitude: -122.49))
//    ]
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.friends) { friend in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: friend.latitude,
                                                                 longitude: friend.longitude)) {
                    CustomMapAnnotation(nickname: friend.nickname)
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

//struct Place: Identifiable {
//    let id = UUID()
//    let nickname: String
//    let coordinate: CLLocationCoordinate2D
//}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
