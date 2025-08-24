//
//  TmdbGenre.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation

struct TmdbGenre: Codable, Identifiable, Hashable {
    let id: Int
    let name: String?
}

extension TmdbGenre {
    var itemTitle: String {
        name ?? NSLocalizedString("Not Found", comment: "")
    }
}
