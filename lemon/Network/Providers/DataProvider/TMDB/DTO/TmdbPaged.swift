//
//  TMDBPaged.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

struct TmdbPaged<T: Codable>: Codable {
    let page: Int?
    let results: [T]?
}
