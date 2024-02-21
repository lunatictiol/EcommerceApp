//
//  Cart.swift
//  EcommerceApp
//
//  Created by sabiq on 21/02/24.
//

import Foundation
import SwiftData
@Model
class Cart: Identifiable{
    var id:String
    let title: String
    let price: Double
    let category: String
    let image: String
    init(
        title:String,
        price: Double,
        category: String,
        image: String
    
    
    ) {
        id = UUID().uuidString
        self.title = title
        self.price = price
        self.category = category
        self.image = image
    }
    
}
