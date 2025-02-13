//
//  SettingsCoordinator.swift
//  Translator
//
//  Created by Igor Plastun on 11.02.2025.
//

import SwiftUI

protocol SettingsNavigation {
    
}

struct SettingsCoordinator: View, SettingsNavigation {
    @State private var path = NavigationPath()
    
    var body: some View {
        MakeView()
    }
}

// MARK: - Private methods
private extension SettingsCoordinator {
    @ViewBuilder
    func MakeView() -> some View {
        let viewModel = SettingsViewModelImpl(navigation: self)
        let View = SettingsView(viewModel: viewModel)
        
        NavigationStack(path: $path) {
            View
        }
    }
}
