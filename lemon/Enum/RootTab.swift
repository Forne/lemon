//
//  RootTab.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//


public enum RootTab: String, CaseIterable, Hashable, Identifiable {
    case explore, library, profile, search, settings
    public var id: String { rawValue }

    public var title: String {
        switch self {
            case .explore: return "Explore"
            case .library: return "Library"
            case .profile: return "Profile"
            case .search: return "Search"
            case .settings: return "Settings"
        }
    }

    public var systemImage: String {
        switch self {
            case .explore: return "sparkles"
            case .library: return "rectangle.stack"
            case .profile: return "person.crop.circle"
            case .search: return "magnifyingglass"
            case .settings: return "gear"
        }
    }
}
