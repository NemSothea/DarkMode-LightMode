//
//  UIColor.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 9/4/24.
//

import SwiftUI

// @ObservableObject allows the object to publish changes to its properties and notify any observers subscribed to those properties.
final class AppearanceManager: ObservableObject {
    
    // @Publishedany changes to its value will be published and listeners will be notified.
    @Published var appearanceMode: AppearanceMode = .automatic // Initial value
    
    func updateAppearance() {
        guard let viewController = UIApplication.shared.windows.first?.rootViewController else { return }
        
        switch self.appearanceMode {
        case .light:
            viewController.view.window?.overrideUserInterfaceStyle = .light
        case .dark:
            viewController.view.window?.overrideUserInterfaceStyle = .dark
            
        case .automatic:
            viewController.view.window?.overrideUserInterfaceStyle = .unspecified
        }
    }
}
