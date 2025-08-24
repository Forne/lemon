//
//  TmdbAPI.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Moya
import Foundation

enum TmdbTarget {
    case popular
    case top_rated
    case upcoming
    case search(query: String, page: Int)
    case movie(id: Int)
}

extension TmdbTarget: TargetType {
    public var baseURL: URL { URL(string: "https://api.themoviedb.org/3")! }
    
    public var path: String {
        switch self {
        case .popular: return "popular"
        case .top_rated: return "top_rated"
        case .upcoming: return "upcoming"
        case .search: return "/search/movie"
        case .movie(let id): return "/movie/\(id)"
        }
    }
    
    public var method: Moya.Method { return .get }
    public var task: Task { .requestPlain }
    public var sampleData: Data { return Data() }
    public var headers: [String: String]? { ["Accept": "application/json"] }
}
