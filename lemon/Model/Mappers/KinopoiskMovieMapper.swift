//
//  KinopoiskMovie.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation
import KinopoiskAPI

extension Movie {
    init(from kp: KinopoiskAPI.Movie) {
        self.id = kp.id
        self.provider = .kinopoisk
        
        // External IDs
        self.externalIDs = ExternalIDs(
            tmdb: kp.externalId?.tmdb,
            imdb: kp.externalId?.imdb,
            kinopoisk: kp.id
        )
        
        // Type
        self.type = kp.isSeries == true ? "serial" : "movie"
        self.isSerial = kp.isSeries ?? false
        
        // Titles
        self.title = kp.name
        self.enTitle = kp.enName ?? kp.alternativeName
        
        // Year & Descriptions
        self.year = kp.year
        self.description = kp.description
        self.overview = kp.shortDescription
        self.tagline = kp.slogan
        
        // Runtime
        self.runtime = kp.movieLength
        self.isAdult = (kp.ageRating ?? 18) >= 18
        self.status = kp.status?.rawValue ?? "" // TODO
        
        // Images
        self.logo = kp.logo?.url.map {
            ImageAsset(
                url: $0,
                type: .movieLogo,
                source: .kinopoisk
            )
        }
        self.poster = kp.poster?.url.map {
            ImageAsset(
                url: $0,
                type: .poster,
                source: .kinopoisk
            )
        }
        self.backdrop = kp.backdrop?.url.map {
            ImageAsset(
                url: $0,
                type: .backdrop,
                source: .kinopoisk
            )
        }
        self.trailer = nil
        
        // Genres & Countries
        self.genres = kp.genres?.map(\.name) ?? []
        self.countries = kp.countries?.map(\.name) ?? []
        
        // Ratings
        self.ratings = MovieRatings(
            values: [
                .kinopoisk: kp.rating?.kp ?? 0,
                .imdb: kp.rating?.imdb ?? 0
            ])
        
        // Refs
        self.companies = []
        // TODO: optimization
        self.cast = (kp.persons?
            .filter { ["actor"].contains($0.enProfession) }
            .map(PersonRef.init(from:))) ?? []
        self.crew = (kp.persons?
            .filter { !["actor"].contains($0.enProfession) }
            .map(PersonRef.init(from:))) ?? []
        self.similar = (kp.similarMovies?
            .map(MovieRef.init(from:))) ?? []
        self.sequelsAndPrequels = (kp.sequelsAndPrequels?
            .map(MovieRef.init(from:))) ?? []
    }
}

extension Movie {
    static var exampleFromKinopoisk: Movie {
        let data: KinopoiskAPI.Movie? = try? Bundle.main.decode(from: "KinopoiskMovieDetails")
        return Movie.init(from: data!)
    }
}
