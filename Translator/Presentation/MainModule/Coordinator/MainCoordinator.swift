//
//  MainCoordinator.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import SwiftUI

protocol MainNavigation {
    func presentFullScreenConent(_ content: MainFlow.FullScreenCover)
}

struct MainCoordinator: View, MainNavigation {
    @State private var fullScreenPresent: MainFlow.FullScreenCover?
    
    var body: some View {
        MakeView()
    }
    
    func presentFullScreenConent(_ content: MainFlow.FullScreenCover) {
        fullScreenPresent = content
    }
}

// MARK: - Private methods
private extension MainCoordinator {
    @ViewBuilder
    func MakeView() -> some View {
        let viewModel = MainViewModelImpl(navigation: self)
        let View = MainView(viewModel: viewModel)
        
        View
            .fullScreenCover(item: $fullScreenPresent, content: fullScreenContent)
    }
    
    @ViewBuilder
    func fullScreenContent(for flow: MainFlow.FullScreenCover) -> some View {
        switch flow {
        case .result(let recognizedText, let image):
            ResultView(recognizedText: recognizedText, image: image)
        }
    }
}

