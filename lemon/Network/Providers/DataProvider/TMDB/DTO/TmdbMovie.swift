//
//  TmdbMovie.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation

public struct TmdbMovie: Codable, Identifiable, Hashable {
    public let id: Int
    let title, originalTitle: String?
    let tagline, overview, homepage, originalLanguage, status: String?
    let releaseDate: String?
    let adult: Bool?
    let posterPath, backdropPath: String?
    let runtime, budget, revenue, voteCount: Int?
    let popularity, voteAverage: Double?
    
    let genres: [TmdbGenre]?
}

extension TmdbMovie {
    var itemTitle: String {
        if let title { return title }
        return NSLocalizedString("Not Available", comment: "")
    }
    var posterImageLarge: URL? {
        return TmdbProvider.imageUrlBuilder(size: .w500, path: posterPath)
    }
    
    static var examples: [TmdbMovie] {
        let data: TmdbPaged<TmdbMovie>? = try? Bundle.main.decode(from: "TmdbContent")
        return data!.results!
    }
    static var example: TmdbMovie {
        examples[0]
    }
}
