//
//  KinopoiskProvider.swift
//  lemon
//
//  Created by Dmitrii Pervin on 26.08.2025.
//

import KinopoiskAPI
import TMDb
import KinopubClient

public let kinopoiskProvider = KinopoiskProvider(apiKey: Key.kinopoiskApiKey)

public let tmdbProvider = TMDbClient(apiKey: Key.tmdbApiKey)

private let kinopubStore = KinopubClient.UserDefaultsTokenStore(key: "kinopub.tokens")
public let kinopubProvider = KinopubProvider(
    clientId: Key.kinopubClientId,
    clientSecret: Key.kinopubClientSecret,
    tokenStore: kinopubStore)
