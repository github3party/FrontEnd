//
//  MainScene.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI

fileprivate enum TabViewState {
    case cup, home, calendar
}


struct MainScene: View {
    
    @State private var tabState: TabViewState = .home
    
    var body: some View {
        TabView(selection: $tabState) {
            CupScreen()
                .tabItem {
                    Image("cup-\(tabState == .cup ? "clicked" : "default")")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                }
                .tag(TabViewState.cup)
            
            HomeScreen()
                .tabItem {
                    Image("home-\(tabState == .home ? "clicked" : "default")")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                }
                .tag(TabViewState.home)
           
            Text("Calendar")
                .tabItem {
                    Image("calendar-\(tabState == .calendar ? "clicked" : "default")")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                }
                .tag(TabViewState.calendar)
        }
    }
}

struct MainScene_Previews: PreviewProvider {
    static var previews: some View {
        MainScene()
    }
}
