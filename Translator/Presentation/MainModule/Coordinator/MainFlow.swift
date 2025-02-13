//
//  MainFlow.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import Foundation

enum MainFlow {
    enum FullScreenCover: Hashable, Identifiable {
        case result(recognizedText: String, image: AnimalType)
        
        var id: String {
            String(describing: self)
        }
    }
}
