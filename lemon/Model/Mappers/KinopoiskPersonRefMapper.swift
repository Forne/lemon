//
//  KinopoiskMovie.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

extension PersonRef {
    init(from kp: KinopoiskPersonRef) {
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
