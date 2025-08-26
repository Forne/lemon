//
//  KinopoiskMovieRatings.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

public struct MovieRatings: Codable, Equatable, Hashable, Sendable {
    public let kp: Double?
    public let imdb: Double?
    public let tmdb: Double?
    public let filmCritics: Double?
    public let russianFilmCritics: Double?
    public let await: Double?
}
