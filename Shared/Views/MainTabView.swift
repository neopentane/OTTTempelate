//
//  MainTabView.swift
//  OTTTemplateApp
//
//  Created by Shreeram Kelkar on 03/10/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // Add your tabs/views here
            Text("Tab 1")
                .tabItem {
                    Text("Tab 1")
                    Image(systemName: "1.circle")
                }

            Text("Tab 2")
                .tabItem {
                    Text("Tab 2")
                    Image(systemName: "2.circle")
                }
        }
    }
}

#Preview {
    MainTabView()
}
