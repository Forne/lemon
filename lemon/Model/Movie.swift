//
//  Movie.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

public struct Movie: Hashable, Sendable, Identifiable {
    public let id: Int
    public let provider: Provider
    var externalIDs: ExternalIDs
    var type: String // TODO: enum
    var isSerial: Bool
    var title, enTitle: String?
    var year: Int?
    var description, overview, tagline: String?
    var runtime: Int?
    var isAdult: Bool
    var status: String? // TODO: enum

    // Images / Videos
    // TODO: By devices
    var logo: ImageAsset?
    var poster: ImageAsset?
    var backdrop: ImageAsset?
    var trailer: URL? // TODO: struct

    // Meta
    var genres: [String]
    var countries: [String]
    var ratings: MovieRatings
    var companies: [String]

    // Relations
    // let images: [Image]
    var cast: [PersonRef]
    var crew: [PersonRef]
    var similar: [MovieRef]
    var sequelsAndPrequels: [MovieRef]
    // let lists: [List]
    // let reviews: [Review]
}

extension Movie {
    var runtimeText: String? {
        if self.runtime == nil { return nil }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        let value = formatter.string(from: TimeInterval(self.runtime!) * 60)
        guard let value else { return String() }
        return value
    }

    var castText: String? {
        return self.cast
            .compactMap { $0.name?.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .prefix(5)
            .joined(separator: ", ")
    }

    var genresText: String {
        return self.genres.joined(separator: ", ")
    }

    var countriesText: String {
        return self.countries.joined(separator: ", ")
    }
}
