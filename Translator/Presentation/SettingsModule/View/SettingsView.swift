//
//  SettingsView.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import SwiftUI

struct SettingsView<ViewModel: SettingsViewModel>: View {
    @StateObject var viewModel: ViewModel
    
    let arrSettings = ["Rate Us", "Share App", "Contact Us", "Restore Purchases", "Privacy Policy", "Terms of Use"]
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Settings")
                .font(.h1)
                .fontWeight(.bold)
                .foregroundStyle(.black100)
                .frame(height: 58)
            
            VStack(spacing: 0){
                ForEach(arrSettings, id: \.self) { setting in
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

#Preview {
    TabBar()
}
