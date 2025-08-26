//
//  KinopoiskPersonRef.swift
//  lemon
//
//  Created by Dmitrii Pervin on 15.08.2025.
//

import Foundation

public struct PersonMovieRef: Identifiable, Codable, Equatable, Hashable, Sendable {
    public let id: Int
    public let name, enName: String?
    public let profession, enProfession: String? // actor, composer, etc.
    public let description: String? // Character or null
    public let photo: URL?
}
