//
//  VideoAsset.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

struct VideoAsset: Hashable, Sendable {
    var url: URL
    var type: VideoStreamType
    var source: Provider
}
