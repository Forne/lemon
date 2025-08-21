//
//  Errors.swift
//  lemon
//
//  Created by Dmitrii Pervin on 13.08.2025.
//

import Foundation
import Moya

public enum NetworkError: Error, LocalizedError {
    case decoding(Error)
    case http(status: Int, data: Data?)
    case moya(MoyaError)
    case authRequired
    case authFailed(String)
    case cancelled

    public var errorDescription: String? {
        switch self {
        case .decoding(let e): return "Decoding error: \(e.localizedDescription)"
        case .http(let status, _): return "HTTP error: status=\(status)"
        case .moya(let e): return "Moya error: \(e.localizedDescription)"
        case .authRequired: return "Authentication required"
        case .authFailed(let reason): return "Authentication failed: \(reason)"
        case .cancelled: return "Request cancelled"
        }
    }
}
