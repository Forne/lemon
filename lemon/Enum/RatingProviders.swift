//
//  RatingProviders.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

public enum RatingProviders: String, CaseIterable, Identifiable, Sendable, Codable, Hashable {
    case imdb
    case tmdb
    case kinopoisk
    case kinopub
    case filmCritics
    case filmCriticsfromRussia
    case await
    
    public var id: String { rawValue }
    
    var localizedName: String {
        switch self {
        case .tmdb: return NSLocalizedString("provider_tmdb", comment: "TheMovieDB")
        case .kinopoisk: return NSLocalizedString("provider_kinopoisk", comment: "kinopoisk")
        case .kinopub: return NSLocalizedString("provider_kinopub", comment: "kinopub")
        case .filmCritics: return NSLocalizedString("provider_filmCritics", comment: "filmCritics")
        default: return self.rawValue.uppercased()
        }
    }
    
    var logoImage: Image {
        Image("RatingProvidersLogos/" + rawValue)
    }
}
