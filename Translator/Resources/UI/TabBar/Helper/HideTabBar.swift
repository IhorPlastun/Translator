//
//  HideTabBar.swift
//  Translator
//
//  Created by Igor Plastun on 11.02.2025.
//

import SwiftUI

struct HideTabBar: UIViewRepresentable {
    var result: () -> ()
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let tabBarController = view.tabBarController {
                tabBarController.tabBar.isHidden = true
                result()
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

extension UIView {
    var tabBarController: UITabBarController? {
        if let controller = sequence(first: self, next: {
            $0.next
        }).first(where: { $0 is UITabBarController }) as? UITabBarController {
            return controller
        }
        
        return nil
    }
}
