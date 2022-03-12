//
//  ButtonModifier.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    var width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: 44.0)
            .foregroundColor(Color(.white))
            .background(Color("Color 3"))
            .cornerRadius(16)
            .shadow(color: .primary.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

extension View {
    func buttonStyle(width: CGFloat = 300) -> some View {
        self.modifier(ButtonModifier(width: width))
    }
}
