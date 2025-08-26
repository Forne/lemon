//
//  KinopoiskMovieVotes.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

public struct MovieVotes: Codable, Equatable, Hashable, Sendable {
    let kp: Int?
    let imdb: Int?
    let tmdb: Int?
    let filmCritics: Int?
    let russianFilmCritics: Int?
    let await: Int?
}
