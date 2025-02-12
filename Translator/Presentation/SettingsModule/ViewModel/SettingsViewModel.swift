//
//  SettingsViewModel.swift
//  Translator
//
//  Created by Igor Plastun on 11.02.2025.
//

import SwiftUI

protocol SettingsViewModel: ObservableObject {
    func pushMainModule()
}

class SettingsViewModelImpl: SettingsViewModel {
    
    private let navigation: SettingsNavigation
    private let model: SettingsModel
    
    init(navigation: SettingsNavigation, model: SettingsModel) {
        self.navigation = navigation
        self.model = model
    }
    
    func pushMainModule() {
        
    }
}
