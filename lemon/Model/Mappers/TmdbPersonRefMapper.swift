//
//  KinopoiskMovie.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation
import TMDb

extension PersonRef {
    init(from tmdb: TMDb.CastMember) {
        self.id = tmdb.id
        self.provider = .tmdb
        
        self.externalIDs = ExternalIDs(
            kinopoisk: tmdb.id
        )
        
        self.name = tmdb.name
        self.role = tmdb.character
        self.character = tmdb.character
        
        // Images
        self.photo = tmdb.profilePath != nil ? ImageAsset(
            url: URL(string: "https://image.tmdb.org/t/p/h632/\(tmdb.profilePath!)")!,
            type: .poster,
            source: .tmdb
        ) : nil
    }
}
