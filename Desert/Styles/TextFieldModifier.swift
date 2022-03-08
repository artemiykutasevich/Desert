//
//  TextFieldModifier.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: 44)
            .textFieldStyle(.automatic)
            .foregroundColor(Color("Color 3"))
            .background(.ultraThickMaterial)
            .cornerRadius(16)
            .shadow(color: .primary.opacity(0.3), radius: 5, x: 0, y: 5)
    }
}

extension View {
    func textFieldStyle() -> some View {
        self.modifier(TextFieldModifier())
    }
}
