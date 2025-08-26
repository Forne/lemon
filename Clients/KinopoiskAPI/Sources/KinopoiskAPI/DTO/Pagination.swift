//
//  KinopoiskPaged.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

public struct Pagination<T: Codable & Equatable & Hashable & Sendable>: Codable, Equatable, Hashable, Sendable {
    public let docs: [T]
    public let total: Int
    public let limit: Int
    public let page: Int
    public let pages: Int
}
