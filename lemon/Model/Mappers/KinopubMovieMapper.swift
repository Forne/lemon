//
//  TmdbMovieMapper.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

import Foundation
import KinopubClient

extension Movie {
    init(from movie: KinopubClient.MediaItem) {
        self.id = movie.id
        self.provider = .kinopub

        // External IDs
        self.externalIDs = ExternalIDs(
            imdb: (movie.imdb != nil) ? "tt\(String(movie.imdb!))" : nil,
            kinopoisk: movie.kinopoisk,
            kinopub: movie.id
        )

        // Type
        // FIX: всегда "movie" — нужно использовать movie.type (может быть "serial", "multi", "concert" и др.)
        self.type = "movie"
        self.isSerial = movie.seasons != nil ? true : false

        // Titles
        self.title = movie.title
        self.enTitle = movie.title

        // Year & Descriptions
        self.year = movie.year
        self.overview = movie.plot
        self.tagline = nil

        // Runtime
        self.runtime = movie.duration.average
        // FIX: всегда true — нужно использовать movie.advert (признак взрослого контента)
        self.isAdult = true
        // FIX: movie.finished: Bool? — проверяется наличие, а не значение; нужно movie.finished == true
        self.status = movie.finished != nil ? "ended" : "airing"

        // Images
        self.logo = nil

        self.poster = movie.posters?.big != nil ?
            ImageAsset(
                url: URL(string: movie.posters!.big!)!,
                type: .poster,
                source: .kinopub
            ) : nil

        self.backdrop = movie.posters?.wide != nil ?
        ImageAsset(
            url: URL(string: movie.posters!.wide!)!,
            type: .poster,
            source: .kinopub
        ) : nil
        self.trailer = movie.trailer?.url != nil ? URL(string: movie.trailer!.url!) : nil

        // Genres & Countries
        self.genres = movie.genres?.map(\.title) ?? []
        self.countries = movie.countries?.map(\.title) ?? []

        // Ratings
        self.ratings = MovieRatings(
            values: [
                .imdb: Double(movie.imdb_rating ?? 0),
                .kinopoisk: Double(movie.kinopoisk_rating ?? 0),
                .kinopub: Double(movie.rating ?? 0)
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
