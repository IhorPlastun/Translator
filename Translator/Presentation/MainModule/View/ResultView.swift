//
//  ResultView.swift
//  Translator
//
//  Created by Igor Plastun on 12.02.2025.
//

import SwiftUI

struct ResultView: View {
    var recognizedText: String
    var image: AnimalType
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    dismiss()
                } label: {
                    Image(.close)
                        .resizable()
                        .frame(width: 21, height: 21)
                }.frame(width: 48, height: 48)
                    .background(.light)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                
                Spacer()
                
                Text("Result")
                    .font(.h1)
                    .fontWeight(.bold)
                    .foregroundStyle(.black100)
                
                Spacer()
                
                Spacer().frame(width: 58)
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            ZStack {
                Text(recognizedText)
                    .frame(width: 291, height: 142)
                    .foregroundStyle(.black100)
                    .font(.body2)
                    .fontWeight(.bold)
                    .background(.blueDark)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 4)
                
                SpeechBubbleShape()
                    .fill(LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.blueDark.opacity(0.4), location: 0.1),
                            .init(color: Color.blueDark.opacity(1), location: 1)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: 12, height: 169.25)
                    .rotationEffect(.degrees(30))
                    .offset(x: 80, y: 130)
                    .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 4)
            }
            .padding(.top, 91)
            
            Image(image == .cat ? .cat : .dog)
                .resizable()
                .frame(width: 184, height: 184)
                .padding(.top, 125)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(  LinearGradient(
            gradient: Gradient(colors: [Color.gradientLight, Color.gradientGreen]),
            startPoint: .top,
            endPoint: .bottom
        ))
    }
}

#Preview {
    ResultView(recognizedText: "Text", image: .cat)
}
