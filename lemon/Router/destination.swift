//
//  destination.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

@MainActor
@ViewBuilder
func destination(for route: AppRoute) -> some View {
    switch route {
    case .explore: ExploreView()
    case .library: LibraryView()
    case .profile: ProfileView()
    case .settings: SettingsView()
    case .search(let q): SearchView(initialQuery: q)

    case let .movie(p, id): MovieDetailsView(provider: p, id: id)
    case let .person(p, id): PersonDetailsView(provider: p, id: id)
    }
}
