//
//  ImageAsset.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

struct ImageAsset: Hashable, Sendable {
    var url: URL
    var width: Int?
    var height: Int?
    var type: ImageType
    var source: Provider
}
