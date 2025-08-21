//
//  TmdbService.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Moya
import Foundation

public final class KinopoiskProvider {
    private let client: HTTPClient<KinopoiskTarget>
    static let shared = KinopoiskProvider()
    
    public init() {
        let plugin = APIKeyPlugin(location: .header(name: "X-API-KEY")) { Key.kinopoiskApiKey }
        self.client = HTTPClient(plugins: [plugin])
    }
    
    public func getMovie(id: Int) async throws -> KinopoiskMovie {
        try await client.requestDecodable(.movie(id: id))
    }
    
    public func getPerson(id: Int) async throws -> KinopoiskPerson {
        try await client.requestDecodable(.person(id: id))
    }
}
