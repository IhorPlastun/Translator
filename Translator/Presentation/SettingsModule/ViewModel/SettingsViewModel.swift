//
//  SettingsViewModel.swift
//  Translator
//
//  Created by Igor Plastun on 11.02.2025.
//

import SwiftUI

protocol SettingsViewModel: ObservableObject {
    var arrSettings: [String] { get }
}

class SettingsViewModelImpl: SettingsViewModel {
    
    private let navigation: SettingsNavigation
    
    let arrSettings = ["Rate Us", "Share App", "Contact Us", "Restore Purchases", "Privacy Policy", "Terms of Use"]
    
    init(navigation: SettingsNavigation) {
        self.navigation = navigation
    }
}
