//
//  Kinopoisk.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation

public struct KinopoiskMovieRef: Identifiable, Codable, Hashable {
    public let id: Int
    let externalId: KinopoiskExternalIDs?
    let name, alternativeName, enName: String?
    let year: Int?
    let type: String?
    
    let poster: KinopoiskImage?
    let rating: KinopoiskRatings?
}
