//
//  TmdbAPI.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Moya
import Foundation

enum KinopoiskTarget {
    case movie(id: Int)
    case person(id: Int)
}

extension KinopoiskTarget: TargetType {
    public var baseURL: URL { URL(string: "https://api.kinopoisk.dev")! }
    
    public var path: String {
        switch self {
        case .movie(let id): return "/v1.4/movie/\(id)"
        case .person(let id): return "/v1.4/person/\(id)"
        }
    }
    
    public var method: Moya.Method { return .get }
    public var task: Task { .requestPlain }
    public var sampleData: Data { return Data() }
    public var headers: [String: String]? { ["Accept": "application/json"] }
}
