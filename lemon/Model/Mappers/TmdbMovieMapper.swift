//
//  TmdbMovieMapper.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

import Foundation
import TMDb

extension Movie {
    init(from tmdb: TMDb.Movie) {
        self.id = tmdb.id
        self.provider = .tmdb
        
        // External IDs
        self.externalIDs = ExternalIDs(
            tmdb: tmdb.id,
        )
        
        // Type
        self.type = "movie"
        self.isSerial = false
        
        // Titles
        self.title = tmdb.title
        self.enTitle = tmdb.originalTitle
        
        // Year & Descriptions
        self.year = nil
        self.overview = tmdb.overview
        self.tagline = tmdb.tagline
        
        // Runtime
        self.runtime = tmdb.runtime
        self.isAdult = tmdb.isAdultOnly ?? true
        self.status = tmdb.status?.rawValue ?? "" // TODO
        
        // Images
        self.logo = nil
        
        self.poster = tmdb.posterPath != nil ? ImageAsset(
            url: URL(string: "https://image.tmdb.org/t/p/w500/\(tmdb.posterPath!)")!,
            type: .poster,
            source: .tmdb
        ) : nil
        
        self.backdrop = tmdb.backdropPath != nil ? ImageAsset(
            url: URL(string: "https://image.tmdb.org/t/p/w1280/\(tmdb.backdropPath!)")!,
            type: .backdrop,
            source: .tmdb
        ) : nil
        self.trailer = nil
        
        // Genres & Countries
        self.genres = tmdb.genres?.map(\.name) ?? []
        self.countries = tmdb.productionCountries?.map(\.name) ?? []
        
        // Ratings
        self.ratings = MovieRatings(
            values: [
                .imdb: tmdb.voteAverage ?? 0
            ])
        
        // Refs
        self.companies = []
        self.cast = []
        self.crew = []
        self.similar = []
        self.sequelsAndPrequels = []
    }
}

extension Movie {
    
}
