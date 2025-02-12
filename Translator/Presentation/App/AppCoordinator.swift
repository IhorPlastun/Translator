//
//  AppCoordinator.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    
    @Published var rootView: AnyView = AnyView(EmptyView())
    
    init() {
        start()
    }
    
    func start() {
        rootView = AnyView(TabBar())
    }
}
