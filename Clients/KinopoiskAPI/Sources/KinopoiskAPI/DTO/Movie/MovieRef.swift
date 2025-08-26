//
//  Kinopoisk.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation

public struct MovieRef: Identifiable, Codable, Equatable, Hashable, Sendable {
    public let id: Int
    public let externalId: ExternalIDs?
    public let name, alternativeName, enName: String?
    public let year: Int?
    public let type: String?
    
    public let poster: KImage?
    public let rating: MovieRatings?
}
