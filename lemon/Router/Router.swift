//
//  Router.swift
//  lemon
//
//  Created by Dmitrii Pervin on 21.08.2025.
//

import Foundation
import SwiftUI

@MainActor
public final class Router: ObservableObject {
    @Published public var selectedTab: RootTab = .explore
    
    // Stacks for tabs
    @Published private var paths: [RootTab: NavigationPath] = {
        var dict: [RootTab: NavigationPath] = [:]
        for tab in RootTab.allCases { dict[tab] = NavigationPath() }
        return dict
    }()
    
    public func bindingPath(for tab: RootTab) -> NavigationPath? {
        self.paths[tab]
    }
    
    public func binding(for tab: RootTab) -> Binding<NavigationPath> {
        Binding(
            get: { self.paths[tab] ?? NavigationPath() },
            set: { self.paths[tab] = $0 }
        )
    }
    
    public enum Context {
        case stayOnCurrentTab
        case switchTo(RootTab)
        case smart(source: RootTab? = nil)
    }
    
    public func open(_ route: AppRoute, context: Context = .stayOnCurrentTab) {
        let targetTab = self.resolveTab(for: route, context: context)
        let stack = stackFor(route)
        if targetTab == selectedTab {
            push(route, on: targetTab)
        } else {
            setStack(stack, on: targetTab)
            selectedTab = targetTab
        }
    }
    
    public func push(_ route: AppRoute, on tab: RootTab? = nil) {
        let t = tab ?? selectedTab
        var path = paths[t] ?? NavigationPath()
        switch route {
            default:
                path.append(route)
        }
        paths[t] = path
        selectedTab = t
    }
    
    public func pop(on tab: RootTab? = nil) {
        let t = tab ?? selectedTab
        var path = paths[t] ?? NavigationPath()
        if !path.isEmpty { path.removeLast() }
        paths[t] = path
    }
    
    public func setStack(_ routes: [AppRoute], on tab: RootTab) {
        var path = NavigationPath()
        for r in routes { path.append(r) }
        paths[tab] = path
    }
    
    public func reset(_ tab: RootTab? = nil) {
        if let t = tab { paths[t] = NavigationPath() }
        else { for t in RootTab.allCases { paths[t] = NavigationPath() } }
    }
    
    @discardableResult
    public func handle(url: URL) -> Bool {
        guard let stack = parse(url: url) else { return false }
        let last = stack.last!
        let tab = last.preferredTab ?? .explore
        setStack(stack, on: tab)
        selectedTab = tab
        return true
    }
    
    private func resolveTab(for route: AppRoute, context: Context) -> RootTab {
        switch context {
            case .stayOnCurrentTab:
                return selectedTab
            case .switchTo(let tab):
                return tab
            case .smart(let source):
                if let s = source { return s }
            return route.preferredTab ?? selectedTab
        }
    }
    
    private func stackFor(_ route: AppRoute) -> [AppRoute] {
        switch route {
            default:
                return [route]
        }
    }
    
    private func parse(url: URL) -> [AppRoute]? {
        let comps = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let pathItems = url.pathComponents.filter { $0 != "/" }
        guard let first = pathItems.first else { return nil }

        func provider(from raw: String) -> Provider? { Provider(rawValue: raw) }
        func int(_ s: String) -> Int? { Int(s) }

        switch first {
            case "explore":
                return [.explore]
            case "library":
                return [.library]
            case "settings":
                return [.settings]
            case "profile":
                return [.profile]
            case "search":
                let q = comps?.queryItems?.first(where: { $0.name == "q" })?.value
                return [.search(q: q)]
            case "movies":
                // /movies/{provider}/{id}
                guard pathItems.count >= 3,
                      let p = provider(from: pathItems[1]),
                      let movieID = int(pathItems[2]) else { return nil }
//                if pathItems.count >= 5 && pathItems[3] == "episodes", let epid = int(pathItems[4]) {
//                    return [.movie(provider: p, id: movieID), .episode(provider: p, movieID: movieID, id: epid)]
//                } else {
                    return [.movie(provider: p, id: movieID)]
                // }
            case "persons":
                // /persons/{provider}/{id}
                guard pathItems.count >= 3,
                let p = provider(from: pathItems[1]),
                let pid = int(pathItems[2]) else { return nil }
                return [.person(provider: p, id: pid)]
            default:
                return nil
        }
    }
}
