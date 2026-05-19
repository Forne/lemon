//
//  KinopoiskMovieRefMapper.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation
import KinopoiskAPI

extension MovieRef {
    init(from kp: KinopoiskAPI.MovieRef) {
        self.id = kp.id
        self.provider = .kinopoisk
        
        self.externalIDs = ExternalIDs(
            kinopoisk: kp.id
        )
        
        // Titles
        self.title = kp.name
        self.enTitle = kp.enName
        
        self.year = kp.year
        
        // Ratings
        self.ratings = MovieRatings(
            values: [
                .kinopoisk: kp.rating?.kp ?? 0,
                .imdb: kp.rating?.imdb ?? 0,
                .filmCritics: kp.rating?.filmCritics ?? 0
            ])
        
        // Images
        self.poster = kp.poster?.url.map {
            ImageAsset(
                url: $0,
                type: .poster,
                source: .kinopoisk
            )
        }
    }
}

extension MovieRef {
    static var exampleFromKinopoisk: [MovieRef] {
        let data: KinopoiskAPI.Pagination<KinopoiskAPI.MovieRef>? = try? Bundle.main.decode(from: "KinopoiskMovieList")
        return data?.docs.map(MovieRef.init(from: )) ?? []
    }
    
    static var examplesFromKinopoisk: [MovieRef] {
        return exampleFromKinopoisk
    }
}
