//
//  BearerTokenPlugin.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation
import Moya

public protocol AccessTokenProviding: AnyObject {
    var accessToken: String? { get }
}

public final class BearerTokenPlugin: PluginType {
    private weak var provider: AccessTokenProviding?

    public init(provider: AccessTokenProviding) {
        self.provider = provider
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let token = provider?.accessToken else { return request }
        var req = request
        req.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return req
    }
}
