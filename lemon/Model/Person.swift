//
//  Person.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

public struct Person: Identifiable, Hashable, Sendable {
    public let id: Int
    public let provider: Provider
}
