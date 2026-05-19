//
//  Rating.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

public struct MovieRatings: Hashable, Sendable {
    public var values: [RatingProviders: Double]
    
    public func value(for provider: RatingProviders) -> Double? {
        values[provider]
    }
}
