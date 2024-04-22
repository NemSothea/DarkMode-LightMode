//
//  MyTabBarController.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 17/4/24.
//

import UIKit

enum AppearanceMode: String, CaseIterable {
    case light
    case dark
    case automatic
}

class SettingViewController: UIViewController {
    
 
    @IBOutlet weak var settingSegment: UISegmentedControl!
    
    private var appearanceMode: AppearanceMode = .automatic
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.updateAppearance()
        navigationItem.title = "Setting"
    }
    private func updateAppearance() {
       
        switch self.appearanceMode {
        case .light:
            settingSegment.selectedSegmentIndex = 0
        case .dark:
            settingSegment.selectedSegmentIndex = 1
        case .automatic:
            settingSegment.selectedSegmentIndex = 2
        }
    }
  
    @IBAction func updateAction(_ sender: UISegmentedControl) {
        
        guard let viewController = UIApplication.shared.windows.first?.rootViewController else { return }
        
        switch sender.selectedSegmentIndex {
        case 0 :
            viewController.view.window?.overrideUserInterfaceStyle = .light
        case 1 :
            viewController.view.window?.overrideUserInterfaceStyle = .dark
            
        default:
            viewController.view.window?.overrideUserInterfaceStyle = .unspecified
        }
        
#warning("Check dark mode or light mode")
        if viewController.view.window?.overrideUserInterfaceStyle == .dark {
            print("This is dark mode")
        }
#warning("Check hight Contrast")
        if UITraitCollection.current.accessibilityContrast == .high {
            print("This is hight contrast")
        }
    }
}

