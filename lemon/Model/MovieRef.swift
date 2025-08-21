//
//  MovieRef.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

struct MovieRef: Sendable, Hashable, Identifiable {
    public var id: Int
    public var provider: Provider
    var externalIDs: ExternalIDs
    
    var title, enTitle: String?
    
    var poster: ImageAsset?
    var backdrop: ImageAsset?
    var ratings: MovieRatings
}

extension MovieRef {
    static var exampleFromKinopoisk: [MovieRef] {
        let data: KinopoiskPaged<KinopoiskMovie>? = try? Bundle.main.decode(from: "KinopoiskMovieList")
        return data?.docs.map(MovieRef.init(from: )) ?? []
    }
    
    static var examples: [MovieRef] {
        return exampleFromKinopoisk
    }
    
    static var example: MovieRef {
        return exampleFromKinopoisk[0]
    }
}
