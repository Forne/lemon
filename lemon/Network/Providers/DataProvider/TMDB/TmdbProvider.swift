//
//  TmdbService.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Moya
import Foundation

public final class TmdbProvider {
    private let client: HTTPClient<TmdbTarget>
    static let shared = TmdbProvider()
    
    public init() {
        //let plugin = APIKeyPlugin(location: .header(name: "Authorization")) { "Bearer \(Key.tmdbApiKey)" }
        let plugin = APIKeyPlugin(location: .query(name: "api_key")) { Key.tmdbApiKey }
        self.client = HTTPClient(plugins: [plugin])
    }
    
    public func getMovie(id: Int) async throws -> TmdbMovie {
        try await client.requestDecodable(.movie(id: id))
    }
    
    static func imageUrlBuilder(size: TmdbImageSize, path: String? = nil) -> URL? {
        if let path {
            var component = URLComponents()
            component.scheme = "https"
            component.host = "image.tmdb.org"
            component.path = "/\(size.rawValue)\(path)"
            return component.url
        }
        return nil
    }
}
