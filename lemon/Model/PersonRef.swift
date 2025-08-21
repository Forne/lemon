//
//  PersonRef.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

struct PersonRef: Sendable, Hashable, Identifiable {
    public var id: Int
    public var provider: Provider
    var externalIDs: ExternalIDs
    var name: String?
    var role: String? // "Actor", "Director"
    var character: String?
    var photo: ImageAsset?
}

extension PersonRef {
    static var example: PersonRef {
        let data: KinopoiskMovie? = try? Bundle.main.decode(from: "KinopoiskMovieDetails")
        return Movie.init(from: data!).cast[5]
    }
    
    static var exampleList: [PersonRef] {
        let data: KinopoiskMovie? = try? Bundle.main.decode(from: "KinopoiskMovieDetails")
        return Movie.init(from: data!).cast
    }
}
