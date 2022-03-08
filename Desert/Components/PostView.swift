//
//  PostView.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

struct PostView: View {
    @State var isLiked = false
    
    var nickname = "artur"
    var text = "fjfjfjfjfjfjf"
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image("photo")
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                Text("nickname")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            Image("photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                Spacer()
                Text("Date")
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: {
                    isLiked.toggle()
                }, label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.largeTitle)
                    Text("1234")
                })
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 4, y: 3)
                    .padding(.trailing)
            }
            Text("\(nickname) \(text)")
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(25)
        //.strokeStyle(cornerRadius: 25)
        .shadow(color: .primary.opacity(0.3), radius: 5, x: 0, y: 5)
        .padding()
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
