//
//  RootContainerView.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import SwiftUI

public struct RootContainerView: View {
    @EnvironmentObject private var router: Router

    public init() {}

    public var body: some View {
        #if os(iOS)
        AdaptiveRoot_iOS()
        #elseif os(tvOS)
        TabsRootView()
        #elseif os(macOS)
        AdaptiveRoot_macOS()
        #else
        TabsRootView()
        #endif
    }
}

#if os(iOS)
fileprivate struct AdaptiveRoot_iOS: View {
    @Environment(\.horizontalSizeClass) private var hsc

    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if hsc == .compact {
                // iPad tabs
                TabsRootView()
            } else {
                // iPad sidebar
                SidebarRootView()
            }
        } else {
            // iPhone
            TabsRootView()
        }
    }
}
#endif

#if os(macOS)
fileprivate struct AdaptiveRoot_macOS: View {
    @State private var width: CGFloat = 1200

    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            VStack {
                if w < 700 { TabsRootView() } else { SidebarRootView() }
            }
            .onAppear { width = w }
            .onChange(of: w) { width = $0 }
        }
    }
}
#endif
