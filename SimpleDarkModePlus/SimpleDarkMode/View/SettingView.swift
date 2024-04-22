//
//  SettingView.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 17/4/24.
//

import SwiftUI
import UIKit

enum AppearanceMode: String, CaseIterable {
    case light
    case dark
    case automatic
}


struct SettingView: View {
    
    //@ObservedObject on iOS 13
    @ObservedObject var appearanceManager = AppearanceManager()
    
    /// @StateObject on iOS 14 up
    /// @StateObject var appearanceManager = AppearanceManager()
    
    var body: some View {
        VStack {
            Picker("Appearance Mode", selection: $appearanceManager.appearanceMode) {
                ForEach(AppearanceMode.allCases, id: \.self) { mode in
                    Text(mode.rawValue.capitalized)
             
                }
            }
            /// Adds an action to perform when this view detects data release by the
            /// given publisher.
            ///  publisher.first() acts like waiting for the initial announcement about the dress code.
            .onReceive([appearanceManager].publisher.first(), perform: { value in
                value.updateAppearance()
            })
            
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            Spacer()
        }
        
//        .navigationTitle("Setting") //  on iOS 14 up
        
        .navigationBarTitle("Setting") // on iOS 13
    }
}

#Preview {
    
    SettingView()
    
}
