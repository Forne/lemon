//
//  SearchView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var router: Router
    @State private var query: String = ""
    let initialQuery: String?

    init(initialQuery: String? = nil) {
        self.initialQuery = initialQuery
    }

    var body: some View {
        Text("Results")
    }
}
