//
//  KinopoiskPersonRef.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

public struct Person: Identifiable, Codable, Equatable, Hashable, Sendable {
    public let id: Int
    public let name, enName: String?
    public let photo: URL?
    public let sex, birthday, death: String?
    public let growth, age, countAwards: Int?
    public let birthPlace, deathPlace, profession: SimpleItem?
    public let facts: [PersonFact]?
    public let movies: [MovieRef]?
    public let spouses: [PersonSpouseRef]?
}
