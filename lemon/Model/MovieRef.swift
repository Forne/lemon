//
//  MovieRef.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

struct MovieRef: Hashable, Sendable, Identifiable {
    public let id: Int
    public let provider: Provider
    
    var externalIDs: ExternalIDs
    var title, enTitle: String?
    var year: Int?
    var poster: ImageAsset?
    var backdrop: ImageAsset?
    var ratings: MovieRatings
}

