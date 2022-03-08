//
//  TabBar.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct TabBar: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .news
    @State var selectedColor: Color = Color("Color 2")
    @State var tabItemWidth: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            HStack {
                Spacer()
                buttons
                Spacer()
            }
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in:
                            RoundedRectangle(cornerRadius: 34, style: .continuous)
            )
            .background(
                back
            )
            .overlay (
                back2
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            
            .navigationBarBackButtonHidden(true)
        }
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(
                    response: 0.4,
                    dampingFraction: 0.6,
                    blendDuration: 0.7)) {
                        selectedTab = item.tab
                        selectedColor = item.color
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: tabItemWidth, height: 29)
                    Text(item.text)
                        .font(.caption)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    
    var back: some View {
        HStack {
            if selectedTab == .account { Spacer() }
            Circle()
                .fill(selectedColor)
                .frame(width: tabItemWidth)
            if selectedTab == .news { Spacer() }
        }
    }
    
    var back2: some View {
        HStack {
            if selectedTab == .account { Spacer() }
            Rectangle()
                .fill(selectedColor)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectedTab == .news { Spacer() }
        }
        .padding(.horizontal, 10)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
