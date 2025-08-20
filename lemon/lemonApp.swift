//
//  lemonApp.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI
import SwiftData

@main
struct lemonApp: App {
    @StateObject private var router = Router()

    var body: some Scene {
        WindowGroup {
            RootContainerView()
                .environmentObject(router)
                .onOpenURL { url in
                    _ = router.handle(url: url)
                }
        }
    }
}
