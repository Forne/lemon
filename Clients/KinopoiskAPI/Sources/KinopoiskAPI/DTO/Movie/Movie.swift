//
//  Kinopoisk.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation

// MovieDtoV1_4
public struct Movie: Identifiable, Codable, Equatable, Hashable, Sendable {
    public let id: Int
    public let externalId: ExternalIDs?
    public let name, alternativeName, enName: String?
    public let type: MovieType?
    public let typeNumber: MovieTypeNumber?
    public let year: Int?
    public let description, shortDescription, slogan: String?
    public let status: MovieStatus?
    public let movieLength, totalSeriesLength, seriesLength, ageRating: Int?
    public let ratingMpaa: String?
    public let top10, top250: Int?
    public let isSeries, ticketsOnSale: Bool?
    
    public let logo: KLogo?
    public let poster: KImage?
    public let backdrop: KImage?
    public let rating: MovieRatings?
    public let votes: MovieVotes?
    public let reviewInfo: MovieReviewInfo?
    // budget
    // fees
    // premiere
    // watchability
    // audience
    // lists
    // networks
    
    // Relations
    public let names: [MovieName]?
    public let facts: [MovieFact]?
    public let videos: VideoTypes?
    public let genres: [SimpleItem]?
    public let countries: [SimpleItem]?
    public let persons: [PersonMovieRef]?
    public let seasonsInfo: [MovieSeasonInfo]?
    public let similarMovies: [MovieRef]?
    public let sequelsAndPrequels: [MovieRef]?
}

//extension Movie {
//    static var example: Movie {
//        let data: Movie? = try? Bundle.main.decode(from: "KinopoiskMovieDetails")
//        return data!
//    }
//}

public enum MovieType: String, Codable, Equatable, Hashable, Sendable {
    case movie
    case tvSeries = "tv-series"
    case cartoon
    case anime
    case animatedSeries = "animated-series"
    case tvShow = "tv-show"
}

public enum MovieTypeNumber: Int, Codable, Equatable, Hashable, Sendable {
    case movie = 1
    case tvSeries = 2
    case cartoon = 3
    case anime = 4
    case animatedSeries = 5
    case tvShow = 6
}

public enum MovieStatus: String, Codable, Equatable, Hashable, Sendable {
    case filming
    case preProduction = "pre-production"
    case completed
    case announced
    case postProduction = "post-production"
}
