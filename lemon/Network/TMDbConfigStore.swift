//
//  TMDbConfigStore.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

import Foundation
import TMDb

actor TMDbConfigStore {
    static let shared = TMDbConfigStore()
    private var cached: APIConfiguration?
    private var loadedAt: Date?

    private let ttl: TimeInterval = 60 * 60 * 24 * 3

    func get(client: TMDbClient) async throws -> APIConfiguration {
        if let cfg = cached, let ts = loadedAt, Date().timeIntervalSince(ts) < ttl {
            return cfg
        }
//        if let disk = try? loadFromDisk(), let ts = loadedAt, Date().timeIntervalSince(ts) < ttl {
//            cached = disk
//            return disk
//        }
        let cfg = try await client.configurations.apiConfiguration()
        cached = cfg
        loadedAt = Date()
//        try? saveToDisk(cfg)
        return cfg
    }

    private var url: URL {
        let dir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent("tmdb-config.json")
    }
    private func saveToDisk(_ cfg: APIConfiguration) throws {
        let data = try JSONEncoder().encode(cfg)
        try data.write(to: url, options: .atomic)
    }
    private func loadFromDisk() throws -> APIConfiguration {
        let data = try Data(contentsOf: url)
        let cfg = try JSONDecoder().decode(APIConfiguration.self, from: data)
        loadedAt = (try? FileManager.default.attributesOfItem(atPath: url.path)[.modificationDate] as? Date) ?? Date()
        return cfg
    }
}
