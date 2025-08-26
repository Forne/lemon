//
//  KinopoiskExternalIDs.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

public struct ExternalIDs: Codable, Equatable, Hashable, Sendable {
    public let imdb: String?
    public let tmdb: Int?
    public let kpHD: String?
}
