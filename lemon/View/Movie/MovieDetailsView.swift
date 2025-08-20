//
//  MovieDetailsView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

struct MovieDetailsView: View {
    @EnvironmentObject private var router: Router
    let provider: Provider
    let id: Int

    var body: some View {
        VStack() {
            Text("Movie #\(id) [\(provider.rawValue)]").font(.title)
            Button("Person 9") {
                router.open(.person(provider: .tmdb, id: 9))
            }
            Spacer()
        }
#if os(tvOS)
        //.onExitCommand { router.pop() }
        .toolbar(.hidden, for: .tabBar)
#endif
        .navigationTitle("Movie #\(id)")
        
    }
}
