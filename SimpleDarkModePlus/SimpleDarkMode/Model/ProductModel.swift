//
//  WatchModel.swift
//  SimpleDarkMode
//
//  Created by MobileR&D-Sothea007 on 9/4/24.
//

import Foundation

class ProductModel : Codable {
    
    var response: ProductDetail?
    
}

struct ProductDetail: Codable {
    
    var categoryShoeName    : String?
    var categoryWatchName   : String?
    var watchs              : [Details]?
    var shoes               : [Details]?
    
}

struct Details: Codable {
    
    var name        : String?
    var imageName   : String?
    var price       : String?
    var description : String?
    
}
