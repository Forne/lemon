//
//  TmdbMovieMapper.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

import Foundation
import KinopubClient

extension MovieRef {
    init(from movie: KinopubClient.MediaItem) {
        self.id = movie.id
        self.provider = .kinopub
        
        // External IDs
        self.externalIDs = ExternalIDs(
            imdb: (movie.imdb != nil) ? "tt\(String(movie.imdb!))" : nil,
            kinopoisk: movie.kinopoisk,
            kinopub: movie.id
        )
        
        // Titles
        self.title = movie.title
        self.enTitle = movie.title
        
        self.year = movie.year
        
        // Images
        self.poster = movie.posters?.big != nil ?
            ImageAsset(
                url: URL(string: movie.posters!.big!)!,
                type: .poster,
                source: .kinopoisk
            ) : nil
        
        self.backdrop = movie.posters?.wide != nil ?
        ImageAsset(
            url: URL(string: movie.posters!.wide!)!,
            type: .poster,
            source: .kinopoisk
        ) : nil
        //self.trailer = movie.trailer?.url != nil ? URL(string: movie.trailer!.url!) : nil
        
        // Ratings
        self.ratings = MovieRatings(
            values: [
                .imdb: Double(movie.imdb_rating ?? 0),
                .kinopoisk: Double(movie.kinopoisk_rating ?? 0),
                .kinopub: Double(movie.rating ?? 0)
            ])
    }
}

extension Movie {
    
}
