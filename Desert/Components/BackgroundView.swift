//
//  BackgroundView.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ThirdShape2()
                    .foregroundColor(Color("Color 2"))
                    .frame(height: 600)
            }
            VStack {
                Spacer()
                SecondShape()
                    .foregroundColor(Color("Color 3"))
                    .frame(height: 500)
            }
            VStack {
                Spacer()
                FirstShape3()
                    .foregroundColor(Color("Color 4"))
                    .frame(height: 250)
            }
        }
        .frame(alignment: .bottom)
        .background(Color("Color 1"))
        .ignoresSafeArea()
    }
    
    struct FirstShape3: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0.70794 * width, y: 0.00855 * height))
            path.addCurve(to: CGPoint(x: 0, y: 0.76068 * height), control1: CGPoint(x: 0.85981 * width, y: 0.62821 * height), control2: CGPoint(x: 0.18925 * width, y: 0.7094 * height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width, y: 0.29487 * height))
            path.addLine(to: CGPoint(x: 0.70794 * width, y: 0.00855 * height))
            path.closeSubpath()
            return path
        }
    }
    
    struct SecondShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: width, y: 0.47217 * height))
            path.addCurve(to: CGPoint(x: 0, y: 0.00192 * height), control1: CGPoint(x: 0.72196 * width, y: 0.38772 * height), control2: CGPoint(x: 0.36565 * width, y: 0.22457 * height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width, y: 0.47217 * height))
            path.closeSubpath()
            return path
        }
    }
    
    struct ThirdShape2: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: width, y: 0.29174 * height))
            path.addLine(to: CGPoint(x: 0.75701 * width, y: 0.00337 * height))
            path.addCurve(to: CGPoint(x: 0, y: 0.51012 * height), control1: CGPoint(x: 0.50818 * width, y: 0.33642 * height), control2: CGPoint(x: 0.28154 * width, y: 0.39966 * height))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width, y: 0.29174 * height))
            path.closeSubpath()
            return path
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
