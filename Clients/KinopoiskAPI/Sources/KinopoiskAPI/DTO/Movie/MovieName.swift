//
//  KinopoiskMovieName.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

public struct MovieName: Codable, Equatable, Hashable, Sendable {
    public let name: String
    public let language: String?
    public let type: String?
}
