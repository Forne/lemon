//
//  KinopoiskFact.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

public struct MovieFact: Codable, Equatable, Hashable, Sendable {
    public let value: String
    public let type: String?
    public let spoiler: Bool?
}
