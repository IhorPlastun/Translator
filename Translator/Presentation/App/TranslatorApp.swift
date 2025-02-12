//
//  TranslatorApp.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import SwiftUI

@main
struct TranslatorApp: App {
    
    // MARK: - AppCoordinator
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.rootView
        }
    }
}
