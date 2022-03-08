//
//  NewPublication.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct NewPublication: View {
    
    @State var text = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            HStack {
                Text("Add publication")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
            Image("photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            TextField("Description", text: $text)
                .textFieldStyle()
            Button(action: {
                // MARK: add
            }, label: {
                Text("Add publication")
            })
            .buttonStyle()
            Spacer()
        }
        .padding()
        .background(Color("Color 1"))
    }
}

struct NewPublication_Previews: PreviewProvider {
    static var previews: some View {
        NewPublication()
    }
}
