//
//  Movie.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation

public struct Movie: Sendable, Hashable, Identifiable {
    public var id: Int
    var externalIDs: ExternalIDs
    var type: String // TODO: enum
    var isSerial: Bool
    var title, enTitle: String?
    let year: Int?
    let description, overview, tagline: String?
    let runtime: Int?
    let isAdult: Bool
    let status: String? // TODO: enum
    
    // Images / Videos
    // TODO: By devices
    let logo: ImageAsset?
    let poster: ImageAsset?
    let backdrop: ImageAsset?
    let trailer: URL? // TODO: struct
    
    // Meta
    let genres: [String]
    let countries: [String]
    let ratings: MovieRatings
    let companies: [String]
    
    // Relations
    // let images: [Image]
    let cast: [PersonRef]
    let crew: [PersonRef]
    let similar: [MovieRef]
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
    
    var genresText: String {
        return self.genres.joined(separator: ", ")
    }
    
    var countriesText: String {
        return self.countries.joined(separator: ", ")
    }
    
    static var exampleFromKinopoisk: Movie {
        let data: KinopoiskMovie? = try? Bundle.main.decode(from: "KinopoiskMovieDetails")
        return Movie.init(from: data!)
    }
    
    static var example: Movie {
        return exampleFromKinopoisk
    }
}
