//
//  KinopoiskVideo.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

import Foundation

public struct Video: Codable, Equatable, Hashable, Sendable {
    public let url: URL?
    public let name, site, type: String?
    public let size: Int?
}
