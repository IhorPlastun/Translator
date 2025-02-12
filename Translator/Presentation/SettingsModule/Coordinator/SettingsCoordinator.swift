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
        NavigationStack(path: $path) {
            MakeView()
            
        }
    }
}

// MARK: - Private methods
private extension SettingsCoordinator {
    @ViewBuilder
    func MakeView() -> some View {
        let model: SettingsModel = SettingsModelImpl()
        let viewModel = SettingsViewModelImpl(navigation: self, model: model)
        let View = SettingsView(viewModel: viewModel)
        
        View
    }
}
