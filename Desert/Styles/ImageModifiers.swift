//
//  ImageModifiers.swift
//  Desert
//
//  Created by Artem Kutasevich on 11.03.22.
//

import SwiftUI

// MARK: Circle Style

struct ImageCircleModifiers: ViewModifier {
    var diameter: CGFloat
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: diameter, height: diameter)
    }
}

struct ImageCircleStrokeModifier: ViewModifier {
    var strokeSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(strokeSize)
            .background(Circle().fill(.ultraThinMaterial))
    }
}

// MARK: Rounded Rectangle Style

struct ImageRoundedRectangleModifiers: ViewModifier {
    var width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: width / 5))
            .frame(width: width, height: width)
    }
}

struct ImageRoundedRectangleStrokeStyle: ViewModifier {
    var width: CGFloat
    var strokeSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(strokeSize)
            .background(RoundedRectangle(cornerRadius: width / 5 + 2 * strokeSize).fill(.ultraThinMaterial))
    }
}

// MARK: extension

extension View {
    func imageCircleStyle(diameter: CGFloat = 50) -> some View {
        self.modifier(ImageCircleModifiers(diameter: diameter))
    }
    
    func imageCircleStrokeStyle(strokeSize: CGFloat = 6) -> some View {
        self.modifier(ImageCircleStrokeModifier(strokeSize: strokeSize))
    }
    
    func imageRoundedRectangleStyle(width: CGFloat = 50) -> some View {
        self.modifier(ImageRoundedRectangleModifiers(width: width))
    }
    
    func imageRoundedRectangleStrokeStyle(width: CGFloat = 50, strokeSize: CGFloat = 6) -> some View {
        self.modifier(ImageRoundedRectangleStrokeStyle(width: width, strokeSize: strokeSize))
    }
}
