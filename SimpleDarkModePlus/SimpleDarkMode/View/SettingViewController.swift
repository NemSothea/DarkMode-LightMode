//
//  MyTabBarController.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 17/4/24.
//

import UIKit
import SwiftUI

class SettingViewController: UIHostingController<SettingView> {

    required init?(coder aDecoder: NSCoder) {
        /// Connection with SettingView
        super.init(coder: aDecoder, rootView: SettingView())
    }
}

