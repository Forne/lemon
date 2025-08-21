//
//  KinopoiskPersonRef.swift
//  lemon
//
//  Created by Dmitrii Pervin on 15.08.2025.
//

import Foundation

public struct KinopoiskPersonRef: Identifiable, Codable, Hashable {
    public let id: Int
    
    var name, enName: String?
    var profession, enProfession: String? // actor, composer, etc.
    var description: String? // Character or null
    var photo: URL?
}
