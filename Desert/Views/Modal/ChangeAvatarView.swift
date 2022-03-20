//
//  ChangeAvatarView.swift
//  Desert
//
//  Created by Artem Kutasevich on 18.03.22.
//

import SwiftUI

struct ChangeAvatarView: View {
    @StateObject private var viewModel = ChangeAvatarViewModel()
    
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
                        viewModel.source = .library
                        viewModel.showPhotoPicker()
                    }, label: {
                        Label("Gallery", systemImage: "photo")
                    })
                    .buttonStyle(width: 120)
                    
                    Spacer()
                }
                .padding(.bottom)
                
                Button(action: {
                    if viewModel.selectedImage == nil {
                        viewModel.addMyImage(image: viewModel.image!)
                    }
                }, label: {
                    Text("Change avatar")
                        .fontWeight(.bold)
                })
                .buttonStyle()
                
                Spacer()
            }
            .padding()
            .background(Color("Color 1"))
            .navigationTitle("Change avatar")
            .sheet(isPresented: $viewModel.showPicker) {
                ImagePicker(sourceType: viewModel.source == .library ? .photoLibrary : .camera, selectedImage: $viewModel.image)
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

struct ChangeAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeAvatarView()
    }
}
