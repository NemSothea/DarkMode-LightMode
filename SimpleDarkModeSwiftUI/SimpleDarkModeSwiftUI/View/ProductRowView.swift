//
//  ProductView.swift
//  SimpleDarkModeSwiftUI
//
//  Created by MobileR&D-Sothea007 on 10/4/24.
//

import SwiftUI

struct ProductRowView: View {
    
    var detail : Details
    
    var body: some View {
        
        HStack {
            Image(detail.imageName)
                .resizable()
                .frame(width: 107,height: 107)
                .cornerRadius(3.0)
            VStack(alignment:.leading,spacing: 2) {
                Text(detail.name)
                    .font(.system(size: 20))
                    .bold()
                Text(detail.price)
                    .italic()
                Text(detail.description)
                    .font(.system(size: 13))
                    .italic()
                    .lineLimit(3)
            }
            Spacer()
        }
        
    }
}

#Preview {
    
    ProductRowView(detail: Details(name: "Nike", imageName: "shoesimage1", price: "$1,000", description: "A shoe is an item of footwear intended to protect and comfort the human foot. Shoes are also used as an item of decoration and fashion. The design of shoes has varied enormously through time and from culture to culture, with appearance originally being tied to function. Additionally, fashion has often dictated many design elements, such as whether shoes have very high heels or flat ones. Contemporary footwear in the 2010s varies widely in style, complexity and cost. Basic sandals may consist of only a thin sole and simple strap and be sold for a low cost. High fashion shoes made by famous designers may be made of expensive materials, use complex construction and sell for hundreds or even thousands of dollars a pair. Some shoes are designed for specific purposes, such as boots designed specifically for mountaineering or skiing."))
}

