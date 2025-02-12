//
//  Font.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import SwiftUI

extension Font {
    private static let fontDesign: Font.Design = .default
    
    static var h1: Font = .system(size: 32, weight: .regular, design: fontDesign)
    static var body1: Font = .system(size: 16, weight: .regular, design: fontDesign)
    static var body2: Font = .system(size: 12, weight: .regular, design: fontDesign)
    
}
