//
//  APIKeyPlugin.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation
import Moya

public enum APIKeyLocation {
    case header(name: String)
    case query(name: String)
}

public struct APIKeyPlugin: PluginType {
    private let location: APIKeyLocation
    private let valueProvider: () -> String?

    public init(location: APIKeyLocation, valueProvider: @escaping () -> String?) {
        self.location = location
        self.valueProvider = valueProvider
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let key = valueProvider() else { return request }
        var req = request
        switch location {
        case .header(let name):
            req.addValue(key, forHTTPHeaderField: name)
        case .query(let name):
            if var url = req.url, var comps = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                var items = comps.queryItems ?? []
                items.append(URLQueryItem(name: name, value: key))
                comps.queryItems = items
                url = comps.url ?? url
                req.url = url
            }
        }
        return req
    }
}
