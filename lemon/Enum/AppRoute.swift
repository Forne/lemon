//
//  AppRoute.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

public enum AppRoute: Hashable, Identifiable {
    case explore
    case library
    case settings
    case profile
    case search(q: String?)

    case movie(provider: Provider, id: Int)
    //case episode(provider: Provider, movieID: Int, id: Int)
    case person(provider: Provider, id: Int)

    public var id: String {
        switch self {
        case .explore: return "explore"
        case .library: return "library"
        case .settings: return "settings"
        case .profile: return "profile"
        case .search(let q): return "search:\(q ?? "")"
        case .movie(let p, let id): return "movie:\(p.rawValue):\(id)"
        //case .episode(let p, let m, let e): return "episode:\(p.rawValue):\(m):\(e)"
        case .person(let p, let id): return "person:\(p.rawValue):\(id)"
        }
    }

    public var preferredTab: RootTab? {
        switch self {
            case .explore: return .explore
            case .library: return .library
            case .profile: return .profile
            case .search: return .search
            case .settings: return .settings
            case .movie, .person: return .explore
            // case .episode: return .explore
        }
    }
}
