//
//  KinopoiskImage.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation

public struct KinopoiskImage: Codable, Hashable {
    let url: URL?
    let previewUrl: URL?
}

public struct KinopoiskLogo: Codable, Hashable {
    let url: URL?
}

