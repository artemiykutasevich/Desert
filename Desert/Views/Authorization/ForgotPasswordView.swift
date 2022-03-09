//
//  ForgotPasswordView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject private var viewModel = ForgotPasswordViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            DesertView()
            forgotPassword
        }
    }
    
    var forgotPassword: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                HStack {
                    Text("Forgot password ?")
                        .font(.title)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                HStack {
                    Text("Enter the email addres associated with your account")
                        .font(.caption)
                        .foregroundColor(.primary)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                TextField("Email" .uppercased(), text: $viewModel.email)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                
                Button(action: {
                    viewModel.resetPassword()
                    viewModel.showingAlert = true
                }, label: {
                    Text("Reset password")
                        .font(.body)
                        .fontWeight(.bold)
                        .buttonStyle()
                })
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("New password - your email"),
                          message: Text("new password matches email"),
                          dismissButton: .cancel(Text("Okey")))
                }
            }
            .padding()
            .background(.ultraThinMaterial)
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
