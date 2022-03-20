//
//  ChangeNicknameView.swift
//  Desert
//
//  Created by Artem Kutasevich on 19.03.22.
//

import SwiftUI

struct ChangeNicknameView: View {
    @StateObject private var viewModel = ChangeNicknameViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("New nickname", text: $viewModel.nickname)
                    .textFieldStyle()
                
                Button(action: {
                    viewModel.changeNickname()
                }, label: {
                    Text("Change nickname")
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

struct ChangeNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNicknameView()
    }
}
