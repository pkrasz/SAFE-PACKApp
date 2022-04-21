//
//  BasketProduct.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 21/04/2022.
//

import Foundation

struct BasketProduct: Decodable, Encodable, Hashable {
    
    let product: Product
    var amount: Int
    var totalPrice: Double
}
