//
//  Setting.swift
//  SimpleDarkModeSwiftUI
//
//  Created by MobileR&D-Sothea007 on 12/4/24.
//

import SwiftUI

enum AppearanceMode: String, CaseIterable {
    case light
    case dark
    case automatic
}

struct SettingView: View {
    /// A property wrapper type that reflects a value from `UserDefaults` and
    /// invalidates a view on a change in value in that user default
    @AppStorage("appearanceMode") private var appearanceMode: AppearanceMode = .automatic
    
    var body: some View {
        VStack {
            Picker("Appearance Mode", selection: $appearanceMode) {
                ForEach(AppearanceMode.allCases, id: \.self) { mode in
                    Text(mode.rawValue.capitalized)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Spacer()
             
        }
        .preferredColorScheme( appearanceMode == .automatic ? nil : (appearanceMode == .dark ? .dark : .light))
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingView()
}
