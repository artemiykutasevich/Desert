//
//  RegistrationView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            DesertView()
            authorization
        }
    }
    
    var authorization: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                HStack {
                    Text("Registration")
                        .font(.title)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                TextField("Nickname" .uppercased(), text: $viewModel.nickname)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                
                TextField("Email" .uppercased(), text: $viewModel.email)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                
                TextField("Password" .uppercased(), text: $viewModel.firstPassword)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                
                TextField("Confirm Password" .uppercased(), text: $viewModel.secondPassword)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                
                Button(action: {
                    // MARK: add logic
                }, label: {
                    Text("Registration")
                        .font(.body)
                        .fontWeight(.bold)
                        .buttonStyle()
                })
            }
            .padding()
            .background(.ultraThinMaterial)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
