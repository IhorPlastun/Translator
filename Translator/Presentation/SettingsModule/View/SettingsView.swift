//
//  SettingsView.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import SwiftUI

struct SettingsView<ViewModel: SettingsViewModel>: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Settings")
                .font(.h1)
                .fontWeight(.bold)
                .foregroundStyle(.black100)
                .frame(height: 58)
            
            VStack(spacing: 0){
                ForEach(viewModel.arrSettings, id: \.self) { setting in
                    SettingsRow(title: setting)
                }
            }
            .padding(.horizontal, 16)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(  LinearGradient(
            gradient: Gradient(colors: [Color.gradientLight, Color.gradientGreen]),
            startPoint: .top,
            endPoint: .bottom
        ))
    }
}

#Preview {
    TabBar()
}
