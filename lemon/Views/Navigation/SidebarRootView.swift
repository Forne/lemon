//
//  SidebarRootView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

#if os(macOS)
public struct SidebarRootView: View {
    @EnvironmentObject private var router: Router
    
    public init() {}

    public var body: some View {
        NavigationSplitView(columnVisibility: .constant(.automatic)) {
            List(selection: $router.selectedTab) {
                Section("Browse") {
                    ForEach(RootTab.allCases, id: \.self) { tab in
                        NavigationLink(value: tab) {
                            Label(tab.title, systemImage: tab.systemImage)
                        }
                    }
                }
                Section("More") {
                    NavigationLink(value: RootTab.library) {
                        Label("Watchlist", systemImage: "bookmark")
                    }
                }
            }
            .navigationTitle("Lalala")
        } detail: {
            NavigationStack(path: router.binding(for: router.selectedTab)) {
                TabRootView(tab: router.selectedTab)
                    .navigationTitle(router.selectedTab.title)
                    .navigationDestination(for: AppRoute.self, destination: destination)
            }
        }
    }
}
#endif
