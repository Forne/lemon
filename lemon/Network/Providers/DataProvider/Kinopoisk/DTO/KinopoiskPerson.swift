//
//  KinopoiskPersonRef.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

public struct KinopoiskPerson: Identifiable, Codable, Hashable {
    public let id: Int
    
    var name, enName: String?

    var photo: URL?
}
