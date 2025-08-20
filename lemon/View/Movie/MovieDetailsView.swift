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
        VStack(spacing: 16) {
            Text("Movie #\(id) [\(provider.rawValue)]").font(.title2)
        }
        .padding()
    }
}
