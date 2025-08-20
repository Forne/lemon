//
//  PersonDetailsView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

struct PersonDetailsView: View {
    let provider: Provider
    let id: Int
    var body: some View {
        Text("Person #\(id) [\(provider.rawValue)]").padding()
    }
}
