//
//  Kinopoisk.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation

public struct KinopoiskMovie: Identifiable, Codable, Hashable {
    public let id: Int
    let externalId: KinopoiskExternalIDs?
    let name, alternativeName, enName: String?
    let type: KinopoiskMovieType?
    let typeNumber: KinopoiskMovieTypeNumber?
    let year: Int?
    let description, shortDescription, slogan: String?
    let status: String? // TODO
    let movieLength, totalSeriesLength, seriesLength, ageRating: Int?
    let ratingMpaa: String?
    let top10, top250: Int?
    let isSeries, ticketsOnSale: Bool?
    
    struct ExternalId: Codable, Hashable {
        let kpHD: String?
        let imdb: String?
        let tmdb: Int?
    }
    
    let logo: KinopoiskLogo?
    let poster: KinopoiskImage?
    let backdrop: KinopoiskImage?
    let rating: KinopoiskRatings?
    let votes: KinopoiskVotes?
    
    // Relations
    let names: [KinopoiskName]?
    let facts: [KinopoiskFact]?
    let genres: [KinopoiskSimpleItem]?
    let countries: [KinopoiskSimpleItem]?
    let persons: [KinopoiskPersonRef]?
    let similarMovies: [KinopoiskMovie]?
    let sequelsAndPrequels: [KinopoiskMovie]?
}

extension KinopoiskMovie {
    static var example: KinopoiskMovie {
        let data: KinopoiskMovie? = try? Bundle.main.decode(from: "KinopoiskMovieDetails")
        return data!
    }
}

public struct KinopoiskName: Codable, Hashable {
    let name: String
    let language: String?
    let type: String?
}

struct KinopoiskExternalIDs: Codable, Hashable {
    var imdb: String?
    var tmdb: Int?
    var kpHD: String?
}

enum KinopoiskMovieType: String, Codable, Hashable {
    case movie
    case tvSeries = "tv-series"
    case cartoon
    case anime
    case animatedSeries = "animated-series"
    case tvShow = "tv-show"
}

enum KinopoiskMovieTypeNumber: Int, Codable, Hashable {
    case movie = 1
    case tvSeries = 2
    case cartoon = 3
    case anime = 4
    case animatedSeries = 5
    case tvShow = 6
}

enum KinopoiskMovieStatus: String, Codable, Hashable {
    case filming
    case preProduction = "pre-production"
    case completed
    case announced
    case postProduction = "post-production"
}

public struct KinopoiskRatings: Codable, Hashable {
    let kp: Double?
    let imdb: Double?
    let tmdb: Double?
    let filmCritics: Double?
    let russianFilmCritics: Double?
    let await: Double?
}

public struct KinopoiskVotes: Codable, Hashable {
    let kp: Int?
    let imdb: Int?
    let tmdb: Int?
    let filmCritics: Int?
    let russianFilmCritics: Int?
    let await: Int?
}
