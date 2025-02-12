//
//  MainCoordinator.swift
//  Translator
//
//  Created by Igor Plastun on 10.02.2025.
//

import SwiftUI

protocol MainNavigation {
    func pushContent(_ content: MainFlow.Screen)
    func presentFullScreenConent(_ content: MainFlow.FullScreenCover)
}

struct MainCoordinator: View, MainNavigation {
    @State private var path = NavigationPath()
    @State private var fullScreenPresent: MainFlow.FullScreenCover?
    
    var body: some View {
        MakeView()
            .navigationDestination(for: MainFlow.Screen.self) { screen in
                linkDestination(for: screen)
            }
            .fullScreenCover(item: $fullScreenPresent, content: fullScreenContent)
    }
    
    func pushContent(_ content: MainFlow.Screen) {
        path.append(content)
    }
    
    func presentFullScreenConent(_ content: MainFlow.FullScreenCover) {
        fullScreenPresent = content
    }
}

// MARK: - Private methods
private extension MainCoordinator {
    @ViewBuilder
    func MakeView() -> some View {
        let model: MainModel = MainModelImpl()
        let viewModel = MainViewModelImpl(navigation: self, model: model)
        let View = MainView(viewModel: viewModel)
        
        View
    }
    
    @ViewBuilder
    func linkDestination(for flow: MainFlow.Screen) -> some View {
        switch flow {
        case .settings:
            SettingsCoordinator()
        }
    }
    
    @ViewBuilder
    func fullScreenContent(for flow: MainFlow.FullScreenCover) -> some View {
        switch flow {
        case .result(let recognizedText, let image):
            ResultView(recognizedText: recognizedText, image: image)
        default:
            EmptyView()
        }
    }
}
