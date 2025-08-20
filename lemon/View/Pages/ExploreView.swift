//
//  ExploreView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject private var router: Router
    
    var body: some View {
        List {
            Section("Popular") {
                Button("Movie 10") {
                    router.open(.movie(provider: .tmdb, id: 10))
                }
                Button("Movie 11") {
                    router.open(.movie(provider: .tmdb, id: 11))
                }
            }
        }
    }
}
