//
//  PublicationViewModel.swift
//  Desert
//
//  Created by Artem Kutasevich on 10.03.22.
//

import SwiftUI

class PublicationViewModel: ObservableObject {
    @AppStorage("ActiveUserEmail") var activeUserEmail = ""
    private let databaseManager = DatabaseManager.databaseManager
    
    @Published var description = ""
    
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .library
    @Published var showCameraAlert = false
    @Published var cameraError: Picker.CameraErrorType?
    
    @Published var selectedImage: MyImage?
    @Published var myImages: [MyImage] = []
    @Published var showFileAlert = false
    @Published var appError: MyImageError.ErrorType?
    
    func showPhotoPicker() {
        do {
            if source == .camera {
                try Picker.checkPermissions()
            }
            showPicker = true
        } catch {
            showCameraAlert = true
            cameraError = Picker.CameraErrorType(error: error as! Picker.PickerError)
        }
    }
    
    func reset() {
        image = nil
        description = ""
    }
    
    func addMyImage(image: UIImage) {
        let myImage = MyImage()
        do {
            try FileManager().saveImage("\(myImage.id)", image: image)
            myImages.append(myImage)
            databaseManager.addPublication(userEmail: activeUserEmail, image: myImage.id, comment: description)
        } catch {
            showFileAlert = true
            appError = MyImageError.ErrorType(error: error as! MyImageError)
        }
        reset()
    }
}
