//
//  MapViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 14.03.22.
//

import SwiftUI
import MapKit

extension MapView {
    @MainActor class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        var locationManager: CLLocationManager?
        
        @Published var region = MKCoordinateRegion(
            center: MapDetails.defaultLocation,
            span: MapDetails.defaultSpan
        )
        
        func checkIfLocationManagerEnabled() {
            if CLLocationManager.locationServicesEnabled() {
                locationManager = CLLocationManager()
                locationManager?.desiredAccuracy = kCLLocationAccuracyBest
                locationManager?.delegate = self
            } else {
                print("Show alert")
            }
        }
        
        private func checkLocationAuthorization() {
            guard let locationManager = locationManager else {
                return
            }
            
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is restricted likely due to parental controls")
            case .denied:
                print("You have denied this app location permission. Go into settings to change it")
            case .authorizedAlways, .authorizedWhenInUse:
                region = MKCoordinateRegion(
                    center: locationManager.location!.coordinate,
                    span: MapDetails.defaultSpan)
            @unknown default:
                break
            }
        }
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            checkLocationAuthorization()
        }
    }
}
