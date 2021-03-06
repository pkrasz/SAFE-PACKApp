//
//  Order.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 21/04/2022.
//

import Foundation

struct Order: Decodable, Encodable {
    
    let productsList: [BasketProduct]
    let orderNumber: String
    let orderPrice: Double
    let status: Int
    let dateOfTheOrder: String
    let deliveryAddress: String
    let leadTime: String
    let documentName: String
}
