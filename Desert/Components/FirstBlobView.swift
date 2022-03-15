//
//  BlobView.swift
//  Desert
//
//  Created by Artem Kutasevich on 8.03.22.
//

import SwiftUI

// MARK: First Blob View

struct FirstBlobView: View {
    @AppStorage("Animation") var animation = true
    @State var appear = false
    
    var body: some View {
        if animation {
            TimelineView(.animation) { timeline in
                let now = timeline.date.timeIntervalSinceReferenceDate
                let angle = Angle.degrees(now.remainder(dividingBy: 3) * 30)
                let x = cos(angle.radians)
                let angle2 = Angle.degrees(now.remainder(dividingBy: 5) * 20)
                let y = cos(angle2.radians)
                
                Canvas { context, size in
                    context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, y: y),
                                 with: .linearGradient(Gradient(
                                    colors: [Color("Color 4"), Color("Color 2")]),
                                    startPoint: CGPoint(x: 0, y: 0),
                                    endPoint: CGPoint(x: 330, y: 330))
                    )
                }
                .frame(width: 330, height: 210)
                .rotationEffect(.degrees(appear ? 360 : 0))
            }
            .onAppear {
                withAnimation(.linear(duration: 20).repeatForever(autoreverses: true)) {
                    appear = true
                }
            }
        } else {
            Canvas { context, size in
                context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: 1, y: 1),
                             with: .linearGradient(Gradient(
                                colors: [Color("Color 4"), Color("Color 2")]),
                                startPoint: CGPoint(x: 0, y: 0),
                                endPoint: CGPoint(x: 330, y: 330))
                )
            }
            .frame(width: 330, height: 210)
        }
    }
    
    func path(in rect: CGRect, x: Double, y: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: width, y: 0.70142 * height * x))
        path.addCurve(to: CGPoint(x: 0.52273 * width * x, y: 0.86019 * height),
                      control1: CGPoint(x: width * y, y: 1.13854 * height),
                      control2: CGPoint(x: 0.80222 * width * x, y: 0.86019 * height))
        path.addCurve(to: CGPoint(x: 0, y: 0.78199 * height * y),
                      control1: CGPoint(x: 0.24324 * width * x, y: 0.86019 * height),
                      control2: CGPoint(x: 0, y: 1.21911 * height * y))
        path.addCurve(to: CGPoint(x: 0.71061 * width , y: 0),
                      control1: CGPoint(x: 0, y: 0.34487 * height * y),
                      control2: CGPoint(x: 0.43112 * width, y: 0))
        path.addCurve(to: CGPoint(x: width, y: 0.70142 * height * x),
                      control1: CGPoint(x: 0.9901 * width * x, y: 0),
                      control2: CGPoint(x: width * y, y: 0.26431 * height * x))
        path.closeSubpath()
        return path
    }
}

// MARK: Second Blob View

struct SecondBlobView2: View {
    @AppStorage("Animation") var animation = true
    @State var appear = false
    
    var body: some View {
        if animation {
            TimelineView(.animation) { timeline in
                let now = timeline.date.timeIntervalSinceReferenceDate
                let angle = Angle.degrees(now.remainder(dividingBy: 4) * 20)
                let x = cos(angle.radians)
                let angle2 = Angle.degrees(now.remainder(dividingBy: 6) * 20)
                let y = cos(angle2.radians)
                
                Canvas { context, size in
                    context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, y: y),
                                 with: .linearGradient(Gradient(
                                    colors: [Color("Color 4"), Color("Color 2")]),
                                    startPoint: CGPoint(x: 0, y: 0),
                                    endPoint: CGPoint(x: 330, y: 330))
                    )
                }
                .frame(width: 330, height: 210)
                .rotationEffect(.degrees(appear ? 0 : 360))
            }
            .onAppear {
                withAnimation(.linear(duration: 12).repeatForever(autoreverses: true)) {
                    appear = true
                }
            }
        } else {
            Canvas { context, size in
                context.fill(path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: 1, y: 1),
                             with: .linearGradient(Gradient(
                                colors: [Color("Color 4"), Color("Color 2")]),
                                startPoint: CGPoint(x: 0, y: 0),
                                endPoint: CGPoint(x: 330, y: 330))
                )
            }
            .frame(width: 330, height: 210)
        }
    }
    
    func path(in rect: CGRect, x: Double, y: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: width, y: 0.70142 * height * x))
        path.addCurve(to: CGPoint(x: 0.52273 * width * x, y: 0.86019 * height),
                      control1: CGPoint(x: width * y, y: 1.13854 * height),
                      control2: CGPoint(x: 0.80222 * width * x, y: 0.86019 * height))
        path.addCurve(to: CGPoint(x: 0, y: 0.78199 * height * y),
                      control1: CGPoint(x: 0.24324 * width * x, y: 0.86019 * height),
                      control2: CGPoint(x: 0, y: 1.21911 * height * y))
        path.addCurve(to: CGPoint(x: 0.71061 * width , y: 0),
                      control1: CGPoint(x: 0, y: 0.34487 * height * y),
                      control2: CGPoint(x: 0.43112 * width, y: 0))
        path.addCurve(to: CGPoint(x: width, y: 0.70142 * height * x),
                      control1: CGPoint(x: 0.9901 * width * x, y: 0),
                      control2: CGPoint(x: width * y, y: 0.26431 * height * x))
        path.closeSubpath()
        return path
    }
}

// MARK: Blob Shape

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: width, y: 0.70142*height))
        path.addCurve(to: CGPoint(x: 0.52273*width, y: 0.86019*height), control1: CGPoint(x: width, y: 1.13854*height), control2: CGPoint(x: 0.80222*width, y: 0.86019*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.78199*height), control1: CGPoint(x: 0.24324*width, y: 0.86019*height), control2: CGPoint(x: 0, y: 1.21911*height))
        path.addCurve(to: CGPoint(x: 0.71061*width, y: 0), control1: CGPoint(x: 0, y: 0.34487*height), control2: CGPoint(x: 0.43112*width, y: 0))
        path.addCurve(to: CGPoint(x: width, y: 0.70142*height), control1: CGPoint(x: 0.9901*width, y: 0), control2: CGPoint(x: width, y: 0.26431*height))
        path.closeSubpath()
        return path
    }
}

struct BlobView_Previews: PreviewProvider {
    static var previews: some View {
        FirstBlobView()
    }
}
