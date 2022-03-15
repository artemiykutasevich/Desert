//
//  CustomMapAnnotation.swift
//  Desert
//
//  Created by Artem Kutasevich on 15.03.22.
//

import SwiftUI
import MapKit

struct CustomMapAnnotation: View {
    //var user: DatabaseFriend
    var nickname: String
    
    var body: some View {
        ZStack {
            ZStack {
                Canvas { context, size in
                    context.fill(
                        path(in: CGRect(x: 0, y: 0, width: size.width, height: size.height)),
                        with: .color(Color("Color 3"))
                    )
                }
                .frame(width: 40, height: 46)
                
                Image("photo")
                    .resizable()
                    .imageCircleStyle(diameter: 54)
                    .offset(y: -3)
            }
            .offset(y: -23)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.4*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0), control1: CGPoint(x: 0, y: 0.17909*height), control2: CGPoint(x: 0.22386*width, y: 0))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0))
        path.addCurve(to: CGPoint(x: width, y: 0.4*height), control1: CGPoint(x: 0.77614*width, y: 0), control2: CGPoint(x: width, y: 0.17909*height))
        path.addLine(to: CGPoint(x: width, y: 0.48*height))
        path.addLine(to: CGPoint(x: width, y: 0.48*height))
        path.addCurve(to: CGPoint(x: 0.63949*width, y: 0.92428*height), control1: CGPoint(x: width, y: 0.65673*height), control2: CGPoint(x: 0.81376*width, y: 0.81566*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: height), control1: CGPoint(x: 0.57417*width, y: 0.965*height), control2: CGPoint(x: 0.52614*width, y: height))
        path.addCurve(to: CGPoint(x: 0.36051*width, y: 0.92428*height), control1: CGPoint(x: 0.47385*width, y: height), control2: CGPoint(x: 0.42583*width, y: 0.965*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.48*height), control1: CGPoint(x: 0.18625*width, y: 0.81566*height), control2: CGPoint(x: 0, y: 0.65673*height))
        path.addLine(to: CGPoint(x: 0, y: 0.48*height))
        path.addLine(to: CGPoint(x: 0, y: 0.4*height))
        path.closeSubpath()
        return path
    }
}

// MARK: Annotation Shape

struct AnnotationShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.4*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0), control1: CGPoint(x: 0, y: 0.17909*height), control2: CGPoint(x: 0.22386*width, y: 0))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0))
        path.addCurve(to: CGPoint(x: width, y: 0.4*height), control1: CGPoint(x: 0.77614*width, y: 0), control2: CGPoint(x: width, y: 0.17909*height))
        path.addLine(to: CGPoint(x: width, y: 0.48*height))
        path.addLine(to: CGPoint(x: width, y: 0.48*height))
        path.addCurve(to: CGPoint(x: 0.63949*width, y: 0.92428*height), control1: CGPoint(x: width, y: 0.65673*height), control2: CGPoint(x: 0.81376*width, y: 0.81566*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: height), control1: CGPoint(x: 0.57417*width, y: 0.965*height), control2: CGPoint(x: 0.52614*width, y: height))
        path.addCurve(to: CGPoint(x: 0.36051*width, y: 0.92428*height), control1: CGPoint(x: 0.47385*width, y: height), control2: CGPoint(x: 0.42583*width, y: 0.965*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.48*height), control1: CGPoint(x: 0.18625*width, y: 0.81566*height), control2: CGPoint(x: 0, y: 0.65673*height))
        path.addLine(to: CGPoint(x: 0, y: 0.48*height))
        path.addLine(to: CGPoint(x: 0, y: 0.4*height))
        path.closeSubpath()
        return path
    }
}

struct MapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapAnnotation(nickname: "alina")
    }
}
