//
//  SpeechRecognizer.swift
//  Translator
//
//  Created by Igor Plastun on 12.02.2025.
//

import Foundation
import AVFoundation
import Speech
import SwiftUI

protocol SpeechRecognizerProtocol: ObservableObject {
    func startRecording()
    func stopRecording()
}

class SpeechRecognizer: NSObject, SpeechRecognizerProtocol {
    @Published var isRecording = false
    @Published var recognizedText: String = "Press to speak"
    @Published var audioLevels: [CGFloat] = Array(repeating: 0, count: 20)
    
    var onAudioLevelsChanged: (([CGFloat]) -> Void)?
    
    private let audioEngine = AVAudioEngine()
    private let speechRecognizer = SFSpeechRecognizer()
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    
    override init() {
        super.init()
        requestPermission()
    }
    
    private func requestPermission() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                switch authStatus {
                case .authorized:
                    print("Speech recognition authorized")
                default:
                    print("Speech recognition not authorized")
                }
            }
        }
        
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            DispatchQueue.main.async {
                if granted {
                    print("Microphone access granted")
                } else {
                    print("Microphone access denied")
                }
            }
        }
    }
    
    func startRecording() {
        isRecording = true
        recognizedText = "Recording..."
        
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.record, mode: .default, options: .duckOthers)
        try? audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        
        request = SFSpeechAudioBufferRecognitionRequest()
        guard let request = request else { return }
        
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            request.append(buffer)
            self.updateAudioLevels(buffer: buffer)
        }
        
        audioEngine.prepare()
        try? audioEngine.start()
        
        recognitionTask = speechRecognizer?.recognitionTask(with: request) { [weak self] result, error in
            guard let self = self else { return }
            if let result = result {
                DispatchQueue.main.async {
                    self.recognizedText = result.bestTranscription.formattedString
                }
            }
            
            if error != nil || result?.isFinal == true {
                stopRecording()
            }
        }
    }
    
    func stopRecording() {
        isRecording = false
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionTask?.cancel()
        request = nil
        recognitionTask = nil
        audioLevels = Array(repeating: 0, count: 20)
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            onAudioLevelsChanged?(audioLevels)
        }
    }
    
    private func updateAudioLevels(buffer: AVAudioPCMBuffer) {
        guard let channelData = buffer.floatChannelData?[0] else { return }
        
        let channelDataArray = Array(UnsafeBufferPointer(start: channelData, count: Int(buffer.frameLength)))
        let rms = sqrt(channelDataArray.map { $0 * $0 }.reduce(0, +) / Float(buffer.frameLength))
        let base: CGFloat = 4
        let scaling: CGFloat = 200
        let level = base + (CGFloat(rms) * scaling)
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.audioLevels.append(level)
            if self.audioLevels.count > 20 {
                self.audioLevels.removeFirst()
            }
            self.onAudioLevelsChanged?(self.audioLevels)
        }
    }
}
