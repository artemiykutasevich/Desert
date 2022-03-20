//
//  MapViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 14.03.22.
//

import SwiftUI
import MapKit

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    var locationManager: CLLocationManager?
    
    private let databaseManager = DatabaseManager.databaseManager
    private let fileManager = FileManager()
    
    @Published var friends = [DatabaseFriend]()
    
    @Published var region = MKCoordinateRegion(
        center: MapDetails.defaultLocation,
        span: MapDetails.defaultSpan
    )
    
    func setFriends() {
        DispatchQueue.main.async { [self] in
            friends = databaseManager.findFriends(email: activeUserEmail)
        }
    }
    
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
                center: locationManager.location?.coordinate ?? MapDetails.defaultLocation,
                span: MapDetails.defaultSpan)
            DispatchQueue.main.async {
                self.databaseManager.addUserLocation(for: self.activeUserEmail, latitude: locationManager.location?.coordinate.latitude ?? 0.0, longitude: locationManager.location?.coordinate.longitude ?? 0.0)
            }
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func getAvatar(userID: UUID) -> UIImage {
        var image = UIImage()
        do {
            image = try fileManager.readImage(with: databaseManager.findUser(by: userID).avatar ?? UUID())
        } catch let error {
            print(error.localizedDescription)
            image = UIImage(named: "photo")!
        }
        return image
    }
}

