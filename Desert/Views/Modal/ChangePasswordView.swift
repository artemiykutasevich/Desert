//
//  ChangePasswordView.swift
//  Desert
//
//  Created by Artem Kutasevich on 19.03.22.
//

import SwiftUI

struct ChangePasswordView: View {
    @StateObject private var viewModel = ChangePasswordViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("New password", text: $viewModel.firstPassword)
                    .textFieldStyle()
                TextField("Confirm password", text: $viewModel.secondPassword)
                    .textFieldStyle()
                
                Button(action: {
                    viewModel.changePassword()
                }, label: {
                    Text("Change password")
                })
                .buttonStyle()
                
                Spacer()
            }
            .padding()
            .background(Color("Color 1"))
            .navigationTitle("New nickname")
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
