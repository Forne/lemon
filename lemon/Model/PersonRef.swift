//
//  PersonRef.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

struct PersonRef: Hashable, Sendable, Identifiable {
    public let id: Int
    public let provider: Provider
    
    var externalIDs: ExternalIDs
    var name: String?
    var role: String? // "Actor", "Director"
    var character: String?
    var photo: ImageAsset?
}
