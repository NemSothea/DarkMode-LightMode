//
//  ProductList.swift
//  SimpleDarkModeSwiftUI
//
//  Created by MobileR&D-Sothea007 on 10/4/24.
//

import SwiftUI

enum Tabs : String, CaseIterable {
    case watch
    case shoe
    case setting
}

struct ProductListView: View {
    
    @StateObject private var viewModel = LoadProduct()
    @State private var tabSelection : Tabs = .watch

    var body: some View {
        NavigationView {
            TabView(selection: $tabSelection) {
                List {
                    if let watctProducts = viewModel.getWatchsProducts() {
                        ForEach(watctProducts,id:\.name) { product in
                            
                            NavigationLink(destination: ProductDetailView(detail: product), label: {
                                ProductRowView(detail: product)
                            })
                        }
                    }else {
                        ProgressView()
                    }
                }
                .badge(2)
                .tabItem {
                    Label("Watch", systemImage: "watch.analog")
                }
                .tag(Tabs.watch)
                List {
                    if let shoeProducts = viewModel.getShoesProducts() {
                        ForEach(shoeProducts,id:\.name) { product in
                            NavigationLink(destination: ProductDetailView(detail: product), label: {
                                ProductRowView(detail: product)
                            })
                            
                        }
                    }else {
                        ProgressView()
                    }
                }
                .tabItem {
                    Label("Shoe", systemImage: "shoe.fill")
                }
                .tag(Tabs.shoe)
                
                SettingView()
                    .tabItem {
                        Label("Setting", systemImage: "circle.righthalf.filled.inverse")
                    }
                    .tag(Tabs.setting)
            }
            .listStyle(.inset)
            
            .navigationTitle(navigationTitle(for: tabSelection))
        }
        .onAppear {
            viewModel.loadProducts()
        }
        
        .toolbar(.visible, for: .tabBar)
        .toolbarBackground(Color(.bg), for: .tabBar)
        .accentColor(Color.barTint)
        
        
    }
    func navigationTitle(for tab: Tabs) -> String {
        switch tab {
        case .watch:
            return "Watch"
        case .shoe:
            return "Shoe"
        case .setting:
            return "Setting"
        }
    }
    
}

//#Preview {
//    ProductListView()
//}
