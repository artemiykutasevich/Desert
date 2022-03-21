//
//  AuthorizationView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct AuthorizationView: View {
    @StateObject private var viewModel = AuthorizationViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                DesertView()
                authorization
            }
            .onAppear {
                viewModel.printUsers()
            }
        }
    }
    
    var authorization: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                HStack {
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                TextField("Email" .uppercased(), text: $viewModel.email)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password" .uppercased(), text: $viewModel.password)
                    .textFieldStyle()
                    .keyboardType(.default)
                    .textInputAutocapitalization(.never)
                
                Button(action: {
                    viewModel.buttonAction()
                }, label: {
                    Text("Sign in")
                        .font(.body)
                        .fontWeight(.bold)
                        .buttonStyle()
                })
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("User not found"),
                          message: Text("Check your email and password"),
                          dismissButton: .cancel(Text("Okey"), action: {
                        viewModel.email = ""
                        viewModel.password = ""
                    }))
                }
                
                NavigationLink(destination: ForgotPasswordView()) {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color 3"))
                }
                
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .foregroundColor(.primary)
                    
                    NavigationLink(destination: RegistrationView()) {
                        Text("Registration")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color 3"))
                    }
                }
            }
            .padding()
            .background(.ultraThinMaterial)
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthorizationView()
        }
    }
}
