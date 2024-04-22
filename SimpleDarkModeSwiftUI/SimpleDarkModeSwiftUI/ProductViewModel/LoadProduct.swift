//
//  ProductViewModel.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 10/4/24.
//

import Foundation

class LoadProduct : ObservableObject {
    
    @Published var products: ProductDetail?
    
    func loadProducts() {
         let response = loadJson("Product.json")
        products = response.response
    }
    func getShoesProducts() -> [Details]? {
        return products?.shoes
    }
    func getWatchsProducts() -> [Details]? {
        return products?.watchs
    }
    func getShoeName() -> String {
        return products?.categoryShoeName ?? ""
    }
    func getWatchName() -> String {
        return products?.categoryWatchName ?? ""
    }
    
    func loadJson(_ filename : String) -> Response {
        
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Response.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(Response.self):\n\(error)")
        }
        
    }
}



