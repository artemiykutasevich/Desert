//
//  PublicationView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct PublicationView: View {
    @StateObject private var viewModel = PublicationViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity)
                } else {
                    Image("photo")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                }
                
                HStack(spacing: 10) {
                    Spacer()
                    
                    Button(action: {
                        viewModel.source = .camera
                        viewModel.showPhotoPicker()
                    }, label: {
                        Label("Camera", systemImage: "camera")
                    })
                    .buttonStyle(width: 120)
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.source = .libriary
                        viewModel.showPhotoPicker()
                    }, label: {
                        Label("Gallery", systemImage: "photo")
                    })
                    .buttonStyle(width: 120)
                    
                    Spacer()
                }
                .padding(.bottom)
                
                TextField("Description", text: $viewModel.description)
                    .textFieldStyle()
                
                Button(action: {
                    if viewModel.selectedImage == nil {
                        viewModel.addMyImage(viewModel.description, image: viewModel.image!)
                    }
                }, label: {
                    Text("Add publication")
                        .fontWeight(.bold)
                })
                .buttonStyle()
                
                Spacer()
            }
            .padding()
            .background(Color("Color 1"))
            .navigationTitle("Add publication")
            .sheet(isPresented: $viewModel.showPicker) {
                ImagePicker(sourceType: viewModel.source == .libriary ? .photoLibrary : .camera, selectedImage: $viewModel.image)
                    .ignoresSafeArea()
            }
            .alert("Error", isPresented: $viewModel.showCameraAlert, presenting: viewModel.cameraError, actions: { cameraError in
                cameraError.button
            }, message: { cameraError in
                Text(cameraError.message)
            })
        }
    }
}

struct NewPublication_Previews: PreviewProvider {
    static var previews: some View {
        PublicationView()
    }
}
