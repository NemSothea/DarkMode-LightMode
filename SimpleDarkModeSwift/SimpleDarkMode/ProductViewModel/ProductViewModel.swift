//
//  ProductViewModel.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 10/4/24.
//

import Foundation

class ProductViewModel {
    
    private(set) var product : ProductDetail?
    
    func loadJson() {
        
        if let path = Bundle.main.path(forResource: "Product", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let model = try jsonDecoder.decode(ProductModel.self, from: jsonData)
                product = model.response
                
            } catch {
                // handle error
                print(error.localizedDescription)
            }
        }
    }
    
}
