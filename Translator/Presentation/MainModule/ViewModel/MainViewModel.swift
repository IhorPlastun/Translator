//
//  MainViewModel.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import SwiftUI

protocol MainViewModel: ObservableObject {
    var selectedAnimal: AnimalType { get set}
    var isHumanToAnimal: Bool { get }
    var isRecording: Bool { get }
    var audioLevels: [CGFloat] { get }
    var recognizedText: String { get }
    
    func selectAnimal(animal:AnimalType)
    func swapLanguage()
    func startRecording()
    func stopRecording()
}



class MainViewModelImpl: MainViewModel {
    
    private let navigation: MainNavigation
    private let model: MainModel
    
    @Published var selectedAnimal: AnimalType = .dog
    @Published var isHumanToAnimal: Bool = true
    @Published var isRecording: Bool = false
    @Published var audioLevels: [CGFloat] = Array(repeating: 0, count: 20)
    @Published var recognizedText: String = ""
    private var speechRecognizer = SpeechRecognizer()
    
    init(navigation: MainNavigation, model: MainModel) {
        self.navigation = navigation
        self.model = model
        bindSpeechRecognizer()
    }
    
    func selectAnimal(animal: AnimalType) {
        selectedAnimal = animal
    }
    
    func swapLanguage() {
        isHumanToAnimal.toggle()
    }
    
    func startRecording() {
        isRecording = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.speechRecognizer.startRecording()
            }
    }
    
    func stopRecording() {
        isRecording = false
        speechRecognizer.stopRecording()
        audioLevels = speechRecognizer.audioLevels
        recognizedText = speechRecognizer.recognizedText
        
        navigation.presentFullScreenConent(.result(recognizedText: recognizedText, image: selectedAnimal))
    }
    
    private func bindSpeechRecognizer() {
           speechRecognizer.onAudioLevelsChanged = { [weak self] levels in
               DispatchQueue.main.async {
                   self?.audioLevels = levels
               }
           }
       }
}
