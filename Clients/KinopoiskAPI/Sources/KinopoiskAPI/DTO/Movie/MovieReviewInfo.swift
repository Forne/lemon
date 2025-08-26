//
//  KinopoiskMovieReviewInfo.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

public struct MovieReviewInfo: Codable, Equatable, Hashable, Sendable {
    public let count: String?
    public let positiveCount: String?
    public let percentage: String?
}
