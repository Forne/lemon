//
//  TabsRootView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

public struct TabsRootView: View {
    @EnvironmentObject private var router: Router

    public init() {}

    public var body: some View {
        TabView(selection: $router.selectedTab) {
            ForEach(RootTab.allCases, id: \.self) { tab in
                NavigationStack(path: router.binding(for: tab)) {
                    TabRootView(tab: tab)
                        .navigationTitle(tab.title)
                        .navigationDestination(for: AppRoute.self, destination: destination)
                }
                .tabItem { Label(tab.title, systemImage: tab.systemImage) }
                .tag(tab)
            }
        }
    }
}
