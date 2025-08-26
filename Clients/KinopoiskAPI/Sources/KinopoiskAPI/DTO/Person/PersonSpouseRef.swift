//
//  KinopoiskFact.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

public struct PersonSpouseRef: Codable, Equatable, Hashable, Sendable {
    public let id: Int
    
    public let name: String?
    public let sex, divorcedReason, relation: String?
    public let divorced: Bool?
    public let children: Int?
}
