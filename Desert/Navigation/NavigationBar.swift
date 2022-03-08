//
//  NavigationBar.swift
//  Desert
//
//  Created by Artem Kutasevich on 7.03.22.
//

import SwiftUI

struct NavigationBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .news
    
    @State private var showingSheet = false
    
    var title = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            Text("\(title)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            if selectedTab == .news {
                HStack {
                    Spacer()
                    Button(action: {
                        showingSheet.toggle()
                    }, label: {
                        Image(systemName: "plus.app")
                            .font(.title)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.secondary)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                    })
                    .sheet(isPresented: $showingSheet) {
                        NewPublication()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
            }
        }
        .frame(height: 70, alignment: .top)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
