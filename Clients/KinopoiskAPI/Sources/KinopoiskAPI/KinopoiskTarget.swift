//
//  KinopoiskTarget.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Moya
import Foundation

enum KinopoiskTarget {
    case movie(id: Int)
    case person(id: Int)
    
    case movies(params: [String: Any])
    case people(params: [String: Any])
    
    case movieSearch(query: String, page: Int?, limit: Int?, select: [String]?)
    case personSearch(query: String, page: Int?, limit: Int?, select: [String]?)
}

extension KinopoiskTarget: TargetType {
    public var baseURL: URL { URL(string: "https://api.kinopoisk.dev")! }
    
    public var path: String {
        switch self {
        case .movie(let id):  return "/v1.4/movie/\(id)"
        case .person(let id): return "/v1.4/person/\(id)"
        case .movies:         return "/v1.4/movie"
        case .people:         return "/v1.4/person"
        case .movieSearch:    return "/v1.4/movie/search"
        case .personSearch:   return "/v1.4/person/search"
        }
    }
    
    public var method: Moya.Method { return .get }
    
    public var task: Task {
        switch self {
        case .movie, .person:
            return .requestPlain
        case .movies(let params), .people(let params):
            let encoding = URLEncoding(destination: .queryString,
                                       arrayEncoding: .noBrackets,
                                       boolEncoding: .literal)
            return .requestParameters(parameters: params, encoding: encoding)
        case .movieSearch(let q, let page, let limit, let select),
             .personSearch(let q, let page, let limit, let select):
            var p: [String: Any] = ["query": q]
            if let page { p["page"] = page }
            if let limit { p["limit"] = limit }
            if let select, !select.isEmpty { p["selectFields"] = select }
            let encoding = URLEncoding(destination: .queryString,
                                       arrayEncoding: .noBrackets,
                                       boolEncoding: .literal)
            return .requestParameters(parameters: p, encoding: encoding)
        }
    }
    
    public var sampleData: Data {  Data() }
    public var headers: [String: String]? { ["Accept": "application/json"] }
}
