//
//  Provider.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

public enum Provider: String, CaseIterable, Hashable, Identifiable {
    case imdb
    case tmdb
    case kinopoisk
    case trakt
    case cub
    case kinopub
    
    public var id: String { rawValue }
    
    var localizedName: String {
        switch self {
            case .kinopoisk:
                return NSLocalizedString("provider_kinopoisk", comment: "Kinopoisk")
            default: return self.rawValue.uppercased()
        }
    }
}
