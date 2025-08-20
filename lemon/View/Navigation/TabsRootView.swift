//
//  TabsRootView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

public struct TabsRootView: View {
    @EnvironmentObject private var router: Router
    let newTabStyle: Bool = true

    public init() {}

    public var body: some View {
        if newTabStyle {
            TabView(selection: $router.selectedTab) {
                ForEach(RootTab.allCases, id: \.self) { tab in
                    Tab(tab.title, systemImage: tab.systemImage, value: tab) {
                        NavigationStack(path: router.binding(for: tab)) {
                            TabRootView(tab: tab)
                                .navigationTitle(tab.title)
                                .navigationDestination(for: AppRoute.self, destination: destination)
                        }
                    }
                }
            }
            .tabViewStyle(.sidebarAdaptable)
        } else {
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
//        VStack{
//            HStack {
//                Text(router.selectedTab.title)
//                Text(String(router.bindingPath(for: router.selectedTab)!.count))
//            }
//        }
//        .frame(height: 8)
    }
}
