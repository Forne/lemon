//
//  TabRootView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

@MainActor
@ViewBuilder
func TabRootView(tab: RootTab) -> some View {
    switch tab {
    case .explore:
        ExploreView()
    case .library:
        LibraryView()
    case .profile:
        ProfileView()
    case .search:
        SearchView()
    case .settings:
        SettingsView()
    }
}
