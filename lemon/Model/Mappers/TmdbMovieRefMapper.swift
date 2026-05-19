//
//  TmdbMovieMapper.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

import Foundation
import TMDb

extension MovieRef {
    init(from tmdb: TMDb.MovieListItem) {
        self.id = tmdb.id
        self.provider = .tmdb
        
        // External IDs
        self.externalIDs = ExternalIDs(
            tmdb: tmdb.id,
        )
        
        // Titles
        self.title = tmdb.title
        self.enTitle = tmdb.originalTitle
        
        self.year = nil
        
        self.poster = tmdb.posterPath != nil ? ImageAsset(
            url: URL(string: "https://image.tmdb.org/t/p/w342/\(tmdb.posterPath!)")!,
            type: .poster,
            source: .tmdb
        ) : nil
        
        self.backdrop = tmdb.backdropPath != nil ? ImageAsset(
            url: URL(string: "https://image.tmdb.org/t/p/w1280/\(tmdb.backdropPath!)")!,
            type: .backdrop,
            source: .tmdb
        ) : nil
        
        // Ratings
        self.ratings = MovieRatings(
            values: [
                .imdb: tmdb.voteAverage ?? 0
            ])
    }
}

extension Movie {
    
}
