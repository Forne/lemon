//
//  HTTPClient.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation
import Moya

public final class HTTPClient<Target: TargetType> {
    public let provider: MoyaProvider<Target>

    public init(stub: Bool = false, plugins: [PluginType] = []) {
        if stub {
            self.provider = MoyaProvider<Target>(stubClosure: MoyaProvider.immediatelyStub, plugins: plugins)
        } else {
            self.provider = MoyaProvider<Target>(plugins: plugins)
        }
    }

    public func request(_ target: Target) async throws -> HTTPResponse {
        try await withCheckedThrowingContinuation { cont in
            provider.request(target) { result in
                switch result {
                case .success(let response):
                    let headers = (response.response?.allHeaderFields as? [String: String]) ?? [:]
                    cont.resume(returning: HTTPResponse(
                        statusCode: response.statusCode,
                        headers: headers,
                        data: response.data
                    ))
                case .failure(let error):
                    if (error as NSError).code == NSURLErrorCancelled {
                        cont.resume(throwing: NetworkError.cancelled)
                    } else {
                        cont.resume(throwing: NetworkError.moya(error))
                    }
                }
            }
        }
    }

    public func requestDecodable<D: Decodable>(_ target: Target, decoder: JSONDecoder = Decoders.json) async throws -> D {
        let resp = try await request(target)
        guard (200..<300).contains(resp.statusCode) else {
            throw NetworkError.http(status: resp.statusCode, data: resp.data)
        }
        do { return try decoder.decode(D.self, from: resp.data) }
        catch {
            print("Decoding error: %@", error)
            throw NetworkError.decoding(error)
        }
    }
}

public struct HTTPResponse: Sendable {
    public let statusCode: Int
    public let headers: [String: String]
    public let data: Data
}
