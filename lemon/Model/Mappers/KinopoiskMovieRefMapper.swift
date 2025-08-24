//
//  KinopoiskMovieRefMapper.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

extension MovieRef {
    init(from kp: KinopoiskMovieRef) {
        self.id = kp.id
        self.provider = .kinopoisk
        
        self.externalIDs = ExternalIDs(
            kinopoisk: kp.id
        )
        
        // Titles
        self.title = kp.name
        self.enTitle = kp.enName
        
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
