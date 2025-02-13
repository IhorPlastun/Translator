//
//  SettingsRow.swift
//  Translator
//
//  Created by Igor Plastun on 13.02.2025.
//

import SwiftUI

struct SettingsRow: View {
    let title: String
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .font(.body1)
                .fontWeight(.bold)
                .foregroundStyle(.black80)
            Spacer()
            Image(.chevronRight)
        }
        .padding(.horizontal, 16)
        .frame(height: 50)
        .background(RoundedRectangle(cornerRadius: 20).fill(.blueDark))
        .padding(.top, 14)
    }
}
