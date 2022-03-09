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
            registration
        }
        .onAppear {
            viewModel.printAllUsers()
        }
    }
    
    var registration: some View {
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
                    .keyboardType(.default)
                
                TextField("Email" .uppercased(), text: $viewModel.email)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                
                TextField("Password" .uppercased(), text: $viewModel.firstPassword)
                    .textFieldStyle()
                    .keyboardType(.default)
                
                TextField("Confirm Password" .uppercased(), text: $viewModel.secondPassword)
                    .textFieldStyle()
                    .keyboardType(.default)
                
                Button(action: {
                    viewModel.registrationUser()
                    viewModel.showingAlert = true
                }, label: {
                    Text("Create account")
                        .font(.body)
                        .fontWeight(.bold)
                        .buttonStyle()
                })
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("My congratulations"),
                          message: Text("the user is now registered"),
                          dismissButton: .cancel(Text("Cool")))
                }
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
