//
//  KinopoiskPaged.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

struct KinopoiskPaged<T: Codable>: Codable {
    let docs: [T]
    let total: Int
    let limit: Int
    let page: Int
    let pages: Int
}
