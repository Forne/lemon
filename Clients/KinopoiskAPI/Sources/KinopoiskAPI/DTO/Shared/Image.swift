//
//  KinopoiskImage.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation

public struct KImage: Codable, Equatable, Hashable, Sendable {
    public let url: URL?
    public let previewUrl: URL?
}
