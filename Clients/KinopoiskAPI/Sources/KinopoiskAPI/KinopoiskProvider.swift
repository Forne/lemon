//
//  KinopoiskProvider.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation
import Moya

public final class KinopoiskProvider {
    private let client: HTTPClient<KinopoiskTarget>
    
    public init(apiKey: String) {
        let plugin = APIKeyPlugin(location: .header(name: "X-API-KEY")) { apiKey }
        self.client = HTTPClient(plugins: [plugin])
    }
    
    public func getMovie(id: Int) async throws -> Movie {
        try await client.requestDecodable(.movie(id: id))
    }
    
    public func getPerson(id: Int) async throws -> Person {
        try await client.requestDecodable(.person(id: id))
    }
    
    public func listMovies(_ query: KinopoiskQuery) async throws -> Pagination<Movie> {
        try await client.requestDecodable(.movies(params: query.toParameters()))
    }
    
    public func listPeople(_ query: KinopoiskQuery) async throws -> Pagination<Person> {
        try await client.requestDecodable(.people(params: query.toParameters()))
    }
    
    public func searchMovies(_ text: String,
                             page: Int? = nil,
                             limit: Int? = nil,
                             select: [String]? = nil) async throws -> Pagination<Movie> {
        try await client.requestDecodable(.movieSearch(query: text, page: page, limit: limit, select: select))
    }

    public func searchPeople(_ text: String,
                             page: Int? = nil,
                             limit: Int? = nil,
                             select: [String]? = nil) async throws -> Pagination<Person> {
        try await client.requestDecodable(.personSearch(query: text, page: page, limit: limit, select: select))
    }
}
