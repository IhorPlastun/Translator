//
//  TabBarView.swift
//  Translator
//
//  Created by Igor Plastun on 11.02.2025.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedTab: TabModel = .translator
    @State private var isTabBarHidden: Bool = false
    @State private var tabLocation: CGRect = .zero
    @Namespace private var animation
    
    var body: some View {
        ZStack(alignment: .bottom) {
            FakeTabBar()
            
            FloatingTabBar()
        }
    }
}

private extension TabBar {
    @ViewBuilder
    func FakeTabBar() -> some View {
        if #available(iOS 18, *) {
            TabView(selection: $selectedTab) {
                Tab.init(value: .translator) {
                    MainCoordinator()
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
                
                Tab.init(value: .settings) {
                    SettingsCoordinator()
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
            }
        } else {
            TabView(selection: $selectedTab) {
                MainCoordinator()
                    .tag(TabModel.translator)
                    .background {
                        if !isTabBarHidden {
                            HideTabBar{
                                isTabBarHidden = true
                            }
                        }
                    }
                
                SettingsCoordinator()
                    .tag(TabModel.settings)
                    .background {
                        if !isTabBarHidden {
                            HideTabBar{
                                isTabBarHidden = true
                            }
                        }
                    }
            }
        }
    }
    
    @ViewBuilder
    func FloatingTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 4) {
                        Image(tab.rawValue)
                            .font(.title3)
                            .frame(width: 24, height: 24)
                        
                        Text(tab.title)
                            .font(.body2)
                            .foregroundStyle(.black)
                    }
                    .frame(width: 63)
                    .opacity(tab == selectedTab ? 1 : 0.6)
                    .contentShape(.rect)
                    .padding(.horizontal, 21)
                }
                .buttonStyle(.plain)
            }
        }
        .frame(width: 216, height: 82)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.light)
                .shadow(color: Color.shadow.opacity(0.15), radius: 80, x: 0, y: 0)
        )
        .padding(.bottom, 16)
    }
}

#Preview {
    TabBar()
}
