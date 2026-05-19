//
//  KinopoiskMovie.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation
import KinopoiskAPI

extension PersonRef {
    init(from kp: KinopoiskAPI.PersonMovieRef) {
        self.id = kp.id
        self.provider = .kinopoisk
        
        self.externalIDs = ExternalIDs(
            kinopoisk: kp.id
        )
        
        self.name = kp.name
        self.role = kp.profession
        self.character = kp.description
        
        // Images
        self.photo = kp.photo.map {
            ImageAsset(
                url: $0,
                type: .profile,
                source: .kinopoisk
            )
        }
    }
}

extension PersonRef {
    static var exampleFromKinopoisk: PersonRef {
        let data: KinopoiskAPI.Movie? = try? Bundle.main.decode(from: "KinopoiskMovieDetails")
        return Movie.init(from: data!).cast[5]
    }
    
    static var exampleListFromKinopoisk: [PersonRef] {
        let data: KinopoiskAPI.Movie? = try? Bundle.main.decode(from: "KinopoiskMovieDetails")
        return Movie.init(from: data!).cast
    }
}
