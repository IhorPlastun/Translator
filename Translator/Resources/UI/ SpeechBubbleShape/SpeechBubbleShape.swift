//
//  SpeechBubbleShape.swift
//  Translator
//
//  Created by Igor Plastun on 12.02.2025.
//

import SwiftUI

struct SpeechBubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
           var path = Path()
           path.move(to: CGPoint(x: rect.minX, y: rect.minY)) // Верхняя левая точка
           path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY)) // Острая точка снизу
           path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY)) // Правая верхняя точка
           path.closeSubpath()
           return path
       }
}
