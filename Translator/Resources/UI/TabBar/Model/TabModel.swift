//
//  TabModel.swift
//  Translator
//
//  Created by Igor Plastun on 11.02.2025.
//

import Foundation

enum TabModel: String, CaseIterable {
    case translator = "messages-2"
    case settings = "settings"
    
    var title: String {
        switch self {
        case .translator:
            "Translator"
        case .settings:
            "Clicker"
        }
    }
}
