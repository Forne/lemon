//
//  PersonDetailsView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

struct PersonDetailsView: View {
    @EnvironmentObject private var router: Router
    
    let provider: Provider
    let id: Int
    
    var body: some View {
        VStack() {
            Text("Person #\(id) [\(provider.rawValue)]").font(.title)
            Button("Movie 10") {
                router.open(.movie(provider: .tmdb, id: 10))
            }
            Spacer()
        }
#if os(tvOS)
        .toolbar(.hidden, for: .tabBar)
#endif
        .navigationTitle("Person #\(id)")
    }
}
