//
//  MainView.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import SwiftUI

struct MainView<ViewModel: MainViewModel>: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 0){
            headerStack()
            
            buttonStack()
            
            mainPicture()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(  LinearGradient(
            gradient: Gradient(colors: [Color.gradientLight, Color.gradientGreen]),
            startPoint: .top,
            endPoint: .bottom
        ))
    }
}

// MARK: - Views
private extension MainView {
    @ViewBuilder
    func headerStack() -> some View {
        VStack(spacing: 0) {
            Text("Translator")
                .font(.h1)
                .fontWeight(.bold)
                .foregroundStyle(.black100)
                .frame(height: 58)
                .padding(.bottom, 28)
            
            HStack(spacing: 0) {
                Text(viewModel.isHumanToAnimal ? "HUMAN" : "PET")
                    .font(.body1)
                    .foregroundStyle(.black100)
                    .fontWeight(.bold)
                    .frame(width: 135)
                
                Spacer()
                
                Button {
                    viewModel.swapLanguage()
                } label: {
                    Image(.arrowSwapHorizontal)
                }
                
                Spacer()
                
                Text(viewModel.isHumanToAnimal ? "PET" : "HUMAN")
                    .font(.body1)
                    .foregroundStyle(.black100)
                    .fontWeight(.bold)
                    .frame(width: 135)
            }
            .frame(height: 61)
            .padding(.horizontal, 40)
        }
    }
    
    @ViewBuilder
    func buttonStack() -> some View {
        HStack(spacing: 0) {
            Button {
                if viewModel.isRecording {
                    viewModel.stopRecording()
                } else {
                    viewModel.startRecording()
                }
            } label: {
                VStack(spacing: 0){
                    if viewModel.isRecording {
                        soundWaveView()
                    } else {
                        Image(.microphone2)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding(.top, 44)
                        
                        Text("Start Speak")
                            .frame(height: 22)
                            .font(.body1)
                            .foregroundStyle(.black100)
                            .fontWeight(.bold)
                            .padding(.top, 16)
                    }
                }
            }
            .frame(width: 178, height: 178)
            .background(.light)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.25), radius: 14.3, x: 0, y: 4)
            
            Spacer()
            
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .frame(width: 107, height: 176)
                        .foregroundStyle(.light)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.25), radius: 14.3, x: 0, y: 4)
                    VStack(spacing: 0) {
                        Button {
                            viewModel.selectedAnimal = .cat
                        } label: {
                            Image(.cat)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .opacity(viewModel.selectedAnimal == .cat ? 1 : 0.6)
                            
                        }.frame(width: 70, height: 70)
                            .background(.blueLight)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .padding(.bottom, 12)
                        
                        Button {
                            viewModel.selectedAnimal = .dog
                        } label: {
                            Image(.dog)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }.frame(width: 70, height: 70)
                            .background(.greenLight)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .opacity(viewModel.selectedAnimal == .dog ? 1 : 0.6)
                    }
                    .shadow(color: Color.shadow.opacity(0.1), radius: 40, x: 0, y: 20)
                    
                }
                
            }
        }
        .padding(.horizontal, 35)
        .padding(.top, 74)
    }
    
    @ViewBuilder
    func mainPicture() -> some View {
        VStack(spacing: 0) {
            Image(viewModel.selectedAnimal == .dog ? .dog : .cat)
                .resizable()
                .frame(width: 184, height: 184)
            
        }
        .padding(.top, 51)
        .padding(.bottom, 118)
    }
    
    @ViewBuilder
    func soundWaveView() -> some View {
        HStack(spacing: 4) {
            ForEach(viewModel.audioLevels.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.blue)
                    .frame(width: 4, height: viewModel.audioLevels[index])
            }        }
        .frame(width: 140, height: 50)
        .padding(.top, 51)
    }
}

#Preview {
    TabBar()
}
